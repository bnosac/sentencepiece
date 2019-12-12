

#' @title Download a Sentencepiece model
#' @description Download a pre-trained Sentencepiece model. \cr
#' The function \code{sentencepiece_download_model} allows to download pretrained models built on Wikipedia
#' made available at \url{https://github.com/bheinzerling/bpemb}. These models contain Byte Pair Encoded models as well
#' as Glove embeddings of these Byte Pair subwords.
#' @param language a character string with the language name
#' @param vocab_size integer indicating the number of tokens in the final vocabulary. Defaults to 5000.
#' @param dim dimension of the embedding. Either 25, 50, 100, 200 or 300.
#' @param model_dir path to the location where the model will be downloaded to
#' @param type currently only 'bpemb' is allowed indicating to download models available at \url{https://github.com/bheinzerling/bpemb}
#' @return a list with elements 
#' \itemize{
#' \item{language: the provide language}
#' \item{wikicode: the wikipedia code of the provided language}
#' \item{file_model: the path to the Sentencepiece model}
#' \item{url: the url where the model was fetched from}
#' \item{download_failed: logical, indicating if the download failed}
#' \item{download_message: a character string with possible download failure information}
#' \item{glove: a list with elements file_model, url, download_failed and download_message indicating the path to the Glove embeddings. Only present if the dim argument is provided in the function. Otherwise the embeddings will not be downloaded}
#' }
#' @seealso \code{\link{sentencepiece_load_model}}
#' @export
#' @examples
#' ##
#' ## Download only the tokeniser model
#' ##
#' dl <- sentencepiece_download_model("Russian", vocab_size = 1000)
#' dl <- sentencepiece_download_model("English", vocab_size = 1000)
#' dl <- sentencepiece_download_model("French", vocab_size = 1000)
#' dl <- sentencepiece_download_model("Vlaams", vocab_size = 1000)
#' dl <- sentencepiece_download_model("Dutch", vocab_size = 1000)
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000)
#' str(dl)
#' model     <- sentencepiece_load_model(dl$file_model)
#' 
#' ##
#' ## Download the tokeniser model + Glove embeddings of Byte Pairs
#' ##
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50)
#' str(dl)
#' model     <- sentencepiece_load_model(dl$file_model)
#' embedding <- read_word2vec(dl$glove$file_model)
sentencepiece_download_model <- function(language, vocab_size, dim, 
                                         model_dir = system.file(package = "sentencepiece", "models"),
                                         type = "bpemb"){
  
  type <- match.arg(type)
  vocab_size <- as.integer(vocab_size)
  
  download_file <- function(url, to, mode){
    dl <- suppressWarnings(try(
      utils::download.file(url = url, destfile = to, mode = mode),  
      silent = TRUE))
    if(inherits(dl, "try-error")){
      download_failed  <- TRUE
      download_message <- as.character(dl)
    }else if(inherits(dl, "integer") && dl != 0){
      download_failed  <- TRUE
      download_message <- "Download failed. Please check internet connectivity"
    }else{
      download_failed  <- FALSE
      download_message <- "OK"
    }
    list(file_model = to, 
         url = url, 
         download_failed = download_failed, download_message = download_message)
  }
  if(type == "bpemb"){
    models <- list()
    models$language <- language
    models$wikicode <- .bpemb$languages$wikicode[tolower(.bpemb$languages$language) %in% tolower(language)]
    models$wikicode <- unique(models$wikicode)
    if(length(models$wikicode) == 0){
      models$wikicode <- intersect(names(.bpemb$vocab_sizes), language)
    }
    if(length(models$wikicode) > 0){
      language <- head(models$wikicode, 1)
      known_sizes <- .bpemb$vocab_sizes[[language]]
      known_sizes <- sort(as.integer(known_sizes))
      if(!vocab_size %in% known_sizes){
        warning(sprintf("Wikicode %s with vocab_size %s does not exist, you should take vocab_size one of: %s", language, vocab_size, paste(known_sizes, collapse = ", ")))
      }
    }else{
      known_languages <- unique(c(.bpemb$languages$language, names(.bpemb$vocab_sizes)))
      cat(sprintf("You requested %s\nBut you should take one of the following languages/wikicodes: %s\nTo inspect the list of languages/wiki type sentencepiece:::.bpemb$languages", language, paste(sort(known_languages), collapse = ", ")), sep = "\n")
    }
    models$vocab_size <- vocab_size
    
    ## Sentencepiece Model
    url <- sprintf("https://nlp.h-its.org/bpemb/%s/%s.wiki.bpe.vs%s.model", language, language, vocab_size)
    to <- file.path(model_dir, basename(url))
    result <- download_file(url = url, to = to, mode = "wb")
    models$file_model <- result$file_model
    models$url <- result$url
    models$download_failed <- result$download_failed
    models$download_message <- result$download_message
    
    ## Glove Embedding
    if(!missing(dim)){
      dim <- as.integer(dim)
      if(!dim %in% c(25, 50, 100, 200, 300)){
        warning("dim should be either 25, 50, 100, 200 or 300")
      }
      
      url <- sprintf("https://nlp.h-its.org/bpemb/%s/%s.wiki.bpe.vs%s.d%s.w2v.txt.tar.gz", language, language, vocab_size, dim)
      to <- file.path(model_dir, basename(url))
      result <- download_file(url = url, to = to, mode = "wb")
      filename <- utils::untar(result$file_model, list = TRUE)
      utils::untar(result$file_model, files = filename, exdir = model_dir)
      file.remove(result$file_model)
      result$file_model <- file.path(model_dir, filename)
      models$glove <- result  
    }
  }
  models
}


#' @title Read a word2vec embedding file
#' @description  Read a word2vec embedding file
#' @param x path to the file
#' @param encoding character string with the Encoding of the file. Defaults to 'UTF-8'. This is passed on to \code{readLines} 
#' @return a matrix with one row per token containing the embedding of the token
#' @seealso \code{\link{readLines}}
#' @export
#' @examples
#' ## English
#' dl <- sentencepiece_download_model("en", vocab_size = 5000, dim = 100)
#' embedding <- read_word2vec(dl$glove$file_model)
#' 
#' ## Dutch
#' dl <- sentencepiece_download_model("nl", vocab_size = 10000, dim = 25)
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50)
#' embedding <- read_word2vec(dl$glove$file_model)
#' 
#' ## Vlaams
#' dl <- sentencepiece_download_model("Vlaams", vocab_size = 50000, dim = 25)
#' embedding <- read_word2vec(dl$glove$file_model)
read_word2vec <- function(x, encoding = "UTF-8"){
  x <- readLines(x, skipNul = TRUE, encoding = encoding)
  size <- x[1]
  size <- as.numeric(unlist(strsplit(size, " ")))
  x <- x[-1]
  x <- strsplit(x, " ")
  token <- sapply(x, FUN=function(x) x[1])
  emb <- lapply(x, FUN=function(x) as.numeric(x[-1]))
  embedding <- matrix(data = unlist(emb), nrow = size[1], ncol = size[2], dimnames = list(token), byrow = TRUE)
  embedding
}
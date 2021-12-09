

#' @title Download a Sentencepiece model
#' @description Download pretrained models built on Wikipedia
#' made available at \url{https://bpemb.h-its.org} through \url{https://github.com/bheinzerling/bpemb}. 
#' These models contain Byte Pair Encoded models trained with sentencepiece as well
#' as Glove embeddings of these Byte Pair subwords. Models for 275 languages are available.
#' @param language a character string with the language name. This can be either a plain language or a wikipedia shorthand. \cr
#' Possible values can be found by looking at the examples or typing sentencepiece:::.bpemb$languages \cr
#' If you provide multi it downloads the multilingual model available at \url{https://bpemb.h-its.org/multi}
#' @param vocab_size integer indicating the number of tokens in the final vocabulary. Defaults to 5000. Possible values depend on the language. To inspect possible values, type sentencepiece:::.bpemb$vocab_sizes and look to your language of your choice.
#' @param dim dimension of the embedding. Either 25, 50, 100, 200 or 300.
#' @param model_dir path to the location where the model will be downloaded to. Defaults to \code{system.file(package = "sentencepiece", "models")}.
#' @return a list with elements 
#' \itemize{
#' \item{language: the provided language}
#' \item{wikicode: the wikipedia code of the provided language}
#' \item{file_model: the path to the downloaded Sentencepiece model}
#' \item{url: the url where the Sentencepiece model was fetched from}
#' \item{download_failed: logical, indicating if the download failed}
#' \item{download_message: a character string with possible download failure information}
#' \item{glove: a list with elements file_model, url, download_failed and download_message indicating the path to the Glove embeddings in txt format. Only present if the dim argument is provided in the function. Otherwise the embeddings will not be downloaded}
#' \item{glove.bin: a list with elements file_model, url, download_failed and download_message indicating the path to the Glove embeddings in bin format. Only present if the dim argument is provided in the function. Otherwise the embeddings will not be downloaded}
#' }
#' @seealso \code{\link{sentencepiece_load_model}}
#' @export
#' @examples
#' path <- getwd()
#' \dontshow{
#' path <- tempdir()
#' }
#' \donttest{
#' 
#' ##
#' ## Download only the tokeniser model
#' ##
#' dl <- sentencepiece_download_model("Russian", vocab_size = 50000, model_dir = path)
#' dl <- sentencepiece_download_model("English", vocab_size = 100000, model_dir = path)
#' dl <- sentencepiece_download_model("French", vocab_size = 25000, model_dir = path)
#' dl <- sentencepiece_download_model("multi", vocab_size = 320000, model_dir = path)
#' dl <- sentencepiece_download_model("Vlaams", vocab_size = 1000, model_dir = path)
#' dl <- sentencepiece_download_model("Dutch", vocab_size = 25000, model_dir = path)
#' dl <- sentencepiece_download_model("nl", vocab_size = 25000, model_dir = path)
#' str(dl)
#' model     <- sentencepiece_load_model(dl$file_model)
#' 
#' ##
#' ## Download the tokeniser model + Glove embeddings of Byte Pairs
#' ##
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50, model_dir = path)
#' str(dl)
#' model     <- sentencepiece_load_model(dl$file_model)
#' embedding <- read_word2vec(dl$glove$file_model)
#' }
#' 
#' 
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 25,
#'                                    model_dir = tempdir())
#' str(dl)
#' 
#' \dontshow{
#' # clean up for CRAN
#' f <- list.files(tempdir(), pattern = ".vocab$|.model$", full.names = TRUE)
#' invisible(file.remove(f))
#' }
sentencepiece_download_model <- function(language, vocab_size, dim, 
                                         model_dir = system.file(package = "sentencepiece", "models")){
  type <- "bpemb"
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
      cat(sprintf("You requested language '%s'\nBut you should take one of the following languages/wikicodes: %s\nTo inspect the list of languages/wiki type sentencepiece:::.bpemb$languages", language, paste(sort(known_languages), collapse = ", ")), sep = "\n")
    }
    models$vocab_size <- vocab_size
    
    ## Sentencepiece Model
    url <- sprintf("https://bpemb.h-its.org/%s/%s.wiki.bpe.vs%s.model", language, language, vocab_size)
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
      
      url <- sprintf("https://bpemb.h-its.org/%s/%s.wiki.bpe.vs%s.d%s.w2v.txt.tar.gz", language, language, vocab_size, dim)
      to <- file.path(model_dir, basename(url))
      result <- download_file(url = url, to = to, mode = "wb")
      filename <- utils::untar(result$file_model, list = TRUE)
      utils::untar(result$file_model, files = filename, exdir = model_dir)
      file.remove(result$file_model)
      result$file_model <- file.path(model_dir, filename)
      models$glove <- result  
      
      url <- sprintf("https://bpemb.h-its.org/%s/%s.wiki.bpe.vs%s.d%s.w2v.bin.tar.gz", language, language, vocab_size, dim)
      to <- file.path(model_dir, basename(url))
      result <- download_file(url = url, to = to, mode = "wb")
      filename <- utils::untar(result$file_model, list = TRUE)
      utils::untar(result$file_model, files = filename, exdir = model_dir)
      file.remove(result$file_model)
      result$file_model <- file.path(model_dir, filename)
      models$glove.bin <- result 
    }
  }
  models
}





#' @title Tokenise and embed text alongside a Sentencepiece and Word2vec model
#' @description Use a sentencepiece model to tokenise text and get the embeddings of these
#' @param file_sentencepiece the path to the file containing the sentencepiece model
#' @param file_word2vec the path to the file containing the word2vec embeddings
#' @param x the result of a call to \code{\link{sentencepiece_download_model}}. 
#' If this is provided, arguments \code{file_sentencepiece} and \code{file_word2vec} will not be used.
#' @param normalize passed on to \code{\link[word2vec]{read.wordvectors}} to read in \code{file_word2vec}. Defaults to \code{TRUE}.
#' @return an object of class BPEembed which is a list with elements 
#' \itemize{
#' \item{model: a sentencepiece model as loaded with \code{\link{sentencepiece_load_model}}}
#' \item{embedding: a matrix with embeddings as loaded with \code{\link[word2vec]{read.wordvectors}}}
#' \item{dim: the dimension of the embedding}
#' \item{n: the number of elements in the vocabulary}
#' \item{file_sentencepiece: the sentencepiece model file}
#' \item{file_word2vec: the word2vec embedding file}
#' }
#' @seealso \code{\link{predict.BPEembed}}, \code{\link{sentencepiece_load_model}}, \code{\link{sentencepiece_download_model}}, \code{\link[word2vec]{read.wordvectors}}
#' @export
#' @examples
#' ##
#' ## Example loading model from disk
#' ##
#' folder    <- system.file(package = "sentencepiece", "models")
#' embedding <- file.path(folder, "nl.wiki.bpe.vs1000.d25.w2v.bin")
#' model     <- file.path(folder, "nl.wiki.bpe.vs1000.model")
#' encoder   <- BPEembed(model, embedding)  
#' 
#' ## Do tokenisation with the sentencepiece model + embed these
#' txt    <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'             "On est d'accord sur le prix de la biere?")
#' values <- predict(encoder, txt, type = "encode")  
#' str(values) 
#' values
#' 
#' txt <- rownames(values[[1]])
#' predict(encoder, txt, type = "decode") 
#' txt <- lapply(values, FUN = rownames) 
#' predict(encoder, txt, type = "decode") 
BPEembed <- function(file_sentencepiece = x$file_model, file_word2vec = x$glove.bin$file_model, x, normalize = TRUE){
  requireNamespace("word2vec")
  if(packageVersion("word2vec") < "0.2.0"){
    stop("This requires word2vec package >= 0.2.0")
  }
  
  if(!missing(x)){
    file_sentencepiece <- x$file_model
    file_word2vec <- x$glove.bin$file_model
    if(x$glove$download_failed || x$glove.bin$download_failed){
      stop("Your downloads of the models that you provided in x were not successfull")
    }
  }
  stopifnot(is.character(file_sentencepiece))
  stopifnot(is.character(file_word2vec))
  stopifnot(tools::file_ext(file_word2vec) %in% c("bin", "txt"))
  
  model     <- sentencepiece_load_model(file_sentencepiece)
  embedding <- word2vec::read.wordvectors(file_word2vec, type = tools::file_ext(file_word2vec), normalize = normalize)
  if(model$vocab_size != nrow(embedding)){
    stop(sprintf("Model vocabulary size (%s) not the same size as the embedding (%s)", model$vocab_size, nrow(embedding)))
  }
  structure(list(model = model, embedding = embedding, 
                 dim = ncol(embedding), 
                 n = nrow(embedding),
                 file_sentencepiece = file_sentencepiece, 
                 file_word2vec = file_word2vec), class = "BPEembed")
}



#' @title Build a BPEembed model containing a Sentencepiece and Word2vec model
#' @description Build a sentencepiece model on text and build a matching word2vec model on the sentencepiece vocabulary
#' @param x a data.frame with columns doc_id and text
#' @param tokenizer character string with the type of sentencepiece tokenizer. Either 'bpe', 'char', 'unigram' or 'word' for Byte Pair Encoding, Character level encoding,
#' Unigram encoding or pretokenised word encoding. Defaults to 'bpe' (Byte Pair Encoding). Passed on to \code{\link{sentencepiece}}
#' @param args a list of arguments passed on to \code{\link{sentencepiece}}  
#' @param ... arguments passed on to \code{\link[word2vec]{word2vec}} for training a word2vec model
#' @return an object of class BPEembed which is a list with elements 
#' \itemize{
#' \item{model: a sentencepiece model as loaded with \code{\link{sentencepiece_load_model}}}
#' \item{embedding: a matrix with embeddings as loaded with \code{\link[word2vec]{read.wordvectors}}}
#' \item{dim: the dimension of the embedding}
#' \item{n: the number of elements in the vocabulary}
#' \item{file_sentencepiece: the sentencepiece model file}
#' \item{file_word2vec: the word2vec embedding file}
#' }
#' @seealso \code{\link{sentencepiece}}, \code{\link[word2vec]{word2vec}}, \code{\link{predict.BPEembed}}
#' @export
#' @examples
#' library(tokenizers.bpe)
#' data(belgium_parliament, package = "tokenizers.bpe")
#' x     <- subset(belgium_parliament, language %in% "dutch")
#' model <- BPEembedder(x, tokenizer = "unigram", args = list(vocab_size = 1000),
#'                      type = "cbow", dim = 20, iter = 10) 
#' model
#' 
#' txt    <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.")
#' values <- predict(model, txt, type = "encode")  
BPEembedder <- function(x, tokenizer = c("bpe", "char", "unigram", "word"), args = list(vocab_size = 8000, coverage = 0.9999), ...){
  requireNamespace("word2vec")
  if(packageVersion("word2vec") < "0.2.0"){
    stop("This requires word2vec package >= 0.2.0")
  }
  
  tokenizer <- match.arg(tokenizer)
  stopifnot(is.data.frame(x) && all(c("doc_id", "text") %in% colnames(x)))
  ## build sentencepiece model + word2vec model
  f <- tempfile()
  on.exit(file.remove(f))
  writeLines(x$text, con = f)
  args$x <- f
  args$type <- tokenizer
  model <- do.call(sentencepiece, args)
  
  ## replace text with ids and train a word2vec model
  text <- sentencepiece_encode(model, x$text, type = "ids")
  text <- sapply(text, paste, collapse = " ")
  w2v <- word2vec::word2vec(text, ...)
  embedding <- predict(w2v, newdata = model$vocabulary$id, type = "embedding")
  rownames(embedding) <- model$vocabulary$subword
  embedding[is.na(embedding)] <- 0
  
  bpemb <- structure(list(model = model, embedding = embedding, 
                          dim = ncol(embedding), 
                          n = nrow(embedding),
                          file_sentencepiece = model$model_path, 
                          file_word2vec = "RAM"), class = "BPEembed")
  bpemb
}


#' @export
print.BPEembed <- function(x, ...){
  cat(sprintf("A sentencepiece encoder with %s subwords and embedding dimension %s", x$n, x$dim), sep = "\n")
  cat(sprintf("  - Based on model file %s", x$file_sentencepiece), sep = "\n")
  cat(sprintf("  - Based on wordvectors in %s", x$file_word2vec), sep = "\n")
}

#' @title Encode and Decode alongside a BPEembed model
#' @description Use the sentencepiece model to either
#' \itemize{
#' \item{encode: tokenise and embed text}
#' \item{decode: get the untokenised text back of tokenised data}
#' \item{tokenize: only tokenize alongside the sentencepiece model}
#' }
#' @param object an object of class BPEembed as returned by \code{\link{BPEembed}}
#' @param newdata a character vector of text to encode or a character vector of encoded tokens to decode or a list of those
#' @param type character string, either 'encode', 'decode' or 'tokenize'
#' @param ... further arguments passed on to the methods
#' @return 
#' \itemize{
#' \item{in case type is set to \code{'encode'}: a list of matrices containing embeddings of the text which is tokenised with \code{\link{sentencepiece_encode}}}
#' \item{in case type is set to \code{'decode'}: a character vector of decoded text as returned by \code{\link{sentencepiece_decode}}}
#' \item{in case type is set to \code{'tokenize'}: a tokenised \code{\link{sentencepiece_encode}}}
#' }
#' @export
#' @seealso \code{\link{BPEembed}}, \code{\link{sentencepiece_decode}}, \code{\link{sentencepiece_encode}}
#' @examples 
#' embedding <- system.file(package = "sentencepiece", "models", 
#'                          "nl.wiki.bpe.vs1000.d25.w2v.bin")
#' model     <- system.file(package = "sentencepiece", "models", 
#'                          "nl.wiki.bpe.vs1000.model")    
#' encoder   <- BPEembed(model, embedding)  
#' 
#' txt      <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'               "On est d'accord sur le prix de la biere?")
#' values   <- predict(encoder, txt, type = "encode")  
#' str(values) 
#' values
#' 
#' txt <- rownames(values[[1]])
#' predict(encoder, txt, type = "decode") 
#' txt <- lapply(values, FUN = rownames) 
#' predict(encoder, txt, type = "decode") 
#' txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'          "On est d'accord sur le prix de la biere?")
#' predict(encoder, txt, type = "tokenize", "subwords") 
#' predict(encoder, txt, type = "tokenize", "ids")  
predict.BPEembed <- function(object, newdata, type = c("encode", "decode", "tokenize"), ...){
  type <- match.arg(type)
  if(type == "encode"){
    emb <- sentencepiece_encode(object$model, newdata, type = "ids", ...)
    names(emb) <- names(newdata)
    emb <- lapply(emb, FUN=function(i){
      m <- object$embedding[i + 1, , drop = FALSE] 
      m 
    })
    emb
  }else if(type == "decode"){
    sentencepiece_decode(object$model, newdata)
  }else if(type == "tokenize"){
    sentencepiece_encode(object$model, newdata, ...)
  }
}

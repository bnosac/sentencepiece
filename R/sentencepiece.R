
#' @title Construct a Sentencepiece model
#' @description Construct a Sentencepiece model on text.
#' @param x a character vector of path(s) to the text files containing training data
#' @param type either one of 'bpe', 'char', 'unigram' or 'word' for Byte Pair Encoding, Character level encoding,
#' Unigram encoding or pretokenised word encoding. Defaults to 'bpe' (Byte Pair Encoding).
#' @param vocab_size integer indicating the number of tokens in the final vocabulary. Defaults to 8000.
#' @param coverage fraction of characters covered by the model. Must be in the range [0, 1]. A good value to use is about 0.9999.
#' @param model_prefix character string with the name of the model. Defaults to 'sentencepiece'.
#' When executing the function 2 files will be created in the directory specified by \code{model_dir}, namely
#' sentencepiece.model with the model and sentencepiece.vocab containing the vocabulary of the model. 
#' You can change the name of the model by providing the \code{model_prefix} argument.
#' @param model_dir directory where the model will be saved. Defaults to the temporary directory (tempdir())
#' @param threads integer indicating number of threads to use when building the model
#' @param args character string with arguments passed on to sentencepiece::SentencePieceTrainer::Train (for expert use only)
#' @param verbose logical indicating to show progress of sentencepiece training. Defaults to \code{TRUE}.
#' @return an object of class \code{sentencepiece} which is defined at \code{\link{sentencepiece_load_model}}
#' @seealso \code{\link{sentencepiece_load_model}}
#' @export
#' @examples
#' library(tokenizers.bpe)
#' data(belgium_parliament, package = "tokenizers.bpe")
#' path   <- "traindata.txt" 
#' folder <- getwd() 
#' \dontshow{
#' path   <- tempfile("traindata_", fileext = ".txt")
#' folder <- tempdir()
#' }
#' writeLines(belgium_parliament$text, con = path)
#' \dontshow{
#' model <- sentencepiece(path, type = "char", vocab_size = 10, model_dir = folder)
#' model <- sentencepiece(path, type = "unigram", vocab_size = 10, model_dir = folder)
#' model <- sentencepiece(path, type = "bpe", vocab_size = 10, model_dir = folder)
#' }
#' \donttest{
#' model <- sentencepiece(path, type = "char", 
#'                        model_dir = folder, verbose = TRUE)
#' model <- sentencepiece(path, type = "unigram", vocab_size = 20000, 
#'                        model_dir = folder, verbose = TRUE)
#' model <- sentencepiece(path, type = "bpe", vocab_size = 4000, 
#'                        model_dir = folder, verbose = TRUE)
#' 
#' txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'          "On est d'accord sur le prix de la biere?")
#' sentencepiece_encode(model, x = txt, type = "subwords")
#' sentencepiece_encode(model, x = txt, type = "ids")
#' 
#' 
#' model <- sentencepiece_load_model(file.path(folder, "sentencepiece.model"))
#' sentencepiece_encode(model, x = txt, type = "subwords")
#' sentencepiece_encode(model, x = txt, type = "ids")
#' }
#' 
#' \dontshow{
#' # clean up for CRAN
#' file.remove(file.path(folder, "sentencepiece.model"))
#' file.remove(file.path(folder, "sentencepiece.vocab"))
#' file.remove(path)
#' }
sentencepiece <- function(x, type = c("bpe", "char", "unigram", "word"), vocab_size = 8000, coverage = 0.9999, 
                          model_prefix = "sentencepiece", 
                          model_dir = tempdir(), threads = 1L, args, verbose = FALSE){
  oldwd <- getwd()
  on.exit(setwd(oldwd))
  setwd(model_dir)
  if(grepl(pattern = " ", model_prefix)){
    stop("model_prefix should not contain spaces")
  }
  type <- match.arg(type)
  if(missing(args)){
    stopifnot(is.character(x))
    stopifnot(all(file.exists(x)))
    args <- sprintf("--input=%s --model_prefix=%s --vocab_size=%s --character_coverage=%s --model_type=%s", paste(x, collapse=","), model_prefix, vocab_size, coverage, type)
  }else{
    args <- as.character(args)
    model_prefix <- regmatches(args, regexpr(args, pattern = "model_prefix=.+ -"))
    model_prefix <- gsub("^model_prefix=|-$", "", model_prefix)
    model_prefix <- gsub(" +$", "", model_prefix)
    if(length(model_prefix) == 0 || nchar(model_prefix) == 0){
      stop("Please provide at least model_prefix")
    }
  }
  if(verbose){
    result <- spc_train(args)  
  }else{
    msg <- capture.output(result <- spc_train(args))
  }
  model <- file.path(getwd(), sprintf("%s.model", model_prefix))  
  result <- sentencepiece_load_model(file = model)
  result
}


#' @export
print.sentencepiece <- function(x, ...){
  cat("Sentencepiece model", sep = "\n")
  cat(sprintf("  size of the vocabulary: %s", x$vocab_size), sep = "\n")
  cat(sprintf("  model stored at: %s", x$model_path), sep = "\n")
}

#' @title Load a Sentencepiece model
#' @description Load a Sentencepiece model which either was trained with \code{\link{sentencepiece}} or which you have found in the wild.
#' @param file path to the file containing the Sentencepiece model
#' @return an object of class \code{sentencepiece} which is a list with elements
#' \itemize{
#' \item{model: an Rcpp pointer to the model}
#' \item{model_path: the path to the model}
#' \item{vocab_size: the size of the Sentencepiece vocabulary}
#' \item{vocabulary: the Sentencepiece vocabulary which is a data.frame with columns id and subword}
#' }
#' @export
#' @examples
#' model <- system.file(package = "sentencepiece", "models", "nl-fr-dekamer.model")
#' model <- sentencepiece_load_model(file = model)
#' 
#' txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'          "On est d'accord sur le prix de la biere?")
#' sentencepiece_encode(model, x = txt, type = "subwords")
#' sentencepiece_encode(model, x = txt, type = "ids")
sentencepiece_load_model <- function(file = "sentencepiece.model"){
  stopifnot(file.exists(file))
  model <- spc_load_model(file)
  Encoding(model$vocabulary$subword) <- "UTF-8"
  class(model) <- "sentencepiece"
  model
}

#' @title Tokenise text alongside a Sentencepiece model
#' @description Tokenise text alongside a Sentencepiece model
#' @param model an object of class \code{sentencepiece} as returned by \code{\link{sentencepiece_load_model}} or \code{\link{sentencepiece}}
#' @param x a character vector of text (in UTF-8 Encoding)
#' @param type a character string, either 'subwords' or 'ids' to get the subwords or the corresponding ids of these subwords as defined in the vocabulary of the model. 
#' Defaults to 'subwords'.
#' @return a list with tokenised text, one for each element of \code{x}
#' @export
#' @examples
#' model <- system.file(package = "sentencepiece", "models", "nl-fr-dekamer.model")
#' model <- sentencepiece_load_model(file = model)
#' 
#' txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'          "On est d'accord sur le prix de la biere?")
#' sentencepiece_encode(model, x = txt, type = "subwords")
#' sentencepiece_encode(model, x = txt, type = "ids")
sentencepiece_encode <- function(model, x, type = c("subwords", "ids")){
  type <- match.arg(type)
  if(type == "ids"){
    x <- spc_encode_as_ids(model$model, x)  
  }else if(type == "subwords"){
    x <- spc_encode_as_subwords(model$model, x)  
    x <- lapply(x, FUN=function(x){
      Encoding(x) <- "UTF-8"
      x
    })
  }
  x
}




#' @title Decode encoded sequences back to text
#' @description Decode a sequence of Sentencepiece ids into text again
#' @param model an object of class \code{sentencepiece} as returned by \code{\link{sentencepiece_load_model}} or \code{\link{sentencepiece}}
#' @param x an integer vector of Sentencepiece id's or a list of these
#' @export
#' @return a character vector of detokenised text
#' @examples 
#' model <- system.file(package = "sentencepiece", "models", "nl-fr-dekamer.model")
#' model <- sentencepiece_load_model(file = model)
#' 
#' txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
#'          "On est d'accord sur le prix de la biere?")
#'        
#' x <- sentencepiece_encode(model, x = txt, type = "subwords")
#' sentencepiece_decode(model, x)
#' x <- sentencepiece_encode(model, x = txt, type = "ids")
#' sentencepiece_decode(model, x)
sentencepiece_decode <- function(model, x){
  if(is.integer(x) || (is.list(x) && is.integer(x[[1]]))){
    f <- spc_decode_ids
  }else{
    f <- spc_decode_subwords
  }
  if(!is.list(x)){
    x <- f(model$model, x) 
    Encoding(x) <- "UTF-8"
  }else{
    x <- lapply(x, FUN=function(x){
      x <- f(model$model, x)
      Encoding(x) <- "UTF-8"
      x
    })
  }
  x <- unlist(x)
  x
}




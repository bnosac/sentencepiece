#' @title Read a word2vec embedding file
#' @description  Read a word2vec embedding file
#' @param x path to the file
#' @param encoding character string with the Encoding of the file. Defaults to 'UTF-8'. This is passed on to \code{readLines} 
#' @return a matrix with one row per token containing the embedding of the token
#' @seealso \code{\link{readLines}}
#' @export
#' @examples
#' embedding <- system.file(package = "sentencepiece", "models", 
#'                          "nl.wiki.bpe.vs1000.d25.w2v.txt")
#' embedding <- read_word2vec(embedding)
#' head(embedding, 10)
#' 
#' path <- getwd()
#' \dontshow{
#' path <- tempdir()
#' }
#' \donttest{
#' 
#' ## English
#' dl <- sentencepiece_download_model("en", vocab_size = 5000, dim = 100, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model)
#' 
#' ## Dutch
#' dl <- sentencepiece_download_model("nl", vocab_size = 10000, dim = 25, model_dir = path)
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model)
#' 
#' ## Vlaams
#' dl <- sentencepiece_download_model("Vlaams", vocab_size = 50000, dim = 25, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model)
#' }
#' 
#' \dontshow{
#' # clean up for CRAN
#' f <- list.files(tempdir(), pattern = ".vocab$|.model$", full.names = TRUE)
#' invisible(file.remove(f))
#' }
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
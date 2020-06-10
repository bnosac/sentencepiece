#' @title Read a word2vec embedding file
#' @description  Read a word2vec embedding file as a dense matrix. This uses \code{\link[word2vec]{read.wordvectors}} from the word2vec package.
#' @param x path to the file
#' @param type either 'bin' or 'txt' indicating the \code{file} is a binary file or a text file
#' @param n integer, indicating to limit the number of words to read in. Defaults to reading all words.
#' @param normalize logical indicating to normalize the embeddings by dividing by the factor (sqrt(sum(x . x) / length(x))). Defaults to TRUE. 
#' @param encoding encoding to be assumed for the words. Defaults to 'UTF-8'
#' @return a matrix with one row per token containing the embedding of the token
#' @seealso \code{\link[word2vec]{read.wordvectors}}
#' @export
#' @examples
#' embedding <- system.file(package = "sentencepiece", "models", 
#'                          "nl.wiki.bpe.vs1000.d25.w2v.txt")
#' embedding <- read_word2vec(embedding, type = "txt")
#' head(embedding, 10)
#' 
#' path <- getwd()
#' \dontshow{
#' path <- tempdir()
#' }
#' \donttest{
#' ## English
#' dl <- sentencepiece_download_model("en", vocab_size = 5000, dim = 100, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model,     type = "txt")
#' embedding <- read_word2vec(dl$glove.bin$file_model, type = "bin")
#' 
#' ## Dutch
#' dl <- sentencepiece_download_model("nl", vocab_size = 10000, dim = 25, model_dir = path)
#' dl <- sentencepiece_download_model("nl", vocab_size = 1000, dim = 50, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model,     type = "txt", n = 100)
#' embedding <- read_word2vec(dl$glove.bin$file_model, type = "bin", n = 100)
#' 
#' ## Vlaams
#' dl <- sentencepiece_download_model("Vlaams", vocab_size = 50000, dim = 25, model_dir = path)
#' embedding <- read_word2vec(dl$glove$file_model,     type = "txt", n = 2000)
#' embedding <- read_word2vec(dl$glove.bin$file_model, type = "bin", n = 2000)
#' }
#' 
#' \dontshow{
#' # clean up for CRAN
#' f <- list.files(tempdir(), pattern = ".vocab$|.model$", full.names = TRUE)
#' invisible(file.remove(f))
#' }
read_word2vec <- function(x, type = c("txt", "bin"), n = .Machine$integer.max, encoding = "UTF-8", normalize = TRUE){
  type <- match.arg(type)
  requireNamespace("word2vec")
  if(packageVersion("word2vec") < "0.2.0"){
    stop("This requires word2vec package >= 0.2.0")
  }
  embedding <- word2vec::read.wordvectors(file = x, type = type, n = n, encoding = encoding, normalize = normalize)
  embedding
}
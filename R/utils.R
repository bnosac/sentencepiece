


#' @title Remove prefixed underscore
#' @description Remove prefixed underscore unicode character 'LOWER ONE EIGHTH BLOCK' (U+2581)
#' @param x a character vector
#' @param replacement character string how to replace the underscore. Defaults to the empty string.
#' @return \code{x} where the prefixed underscore is removed
#' @export
#' @examples
#' x <- c("\u2581word", "hello", "_regularunderscore")
#' x
#' txt_remove_(x)
txt_remove_ <- function(x, replacement = ""){
  gsub(pattern = "^\u2581", replacement = replacement, x)
}
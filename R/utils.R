


#' @title Remove prefixed underscore
#' @description Remove prefixed underscore unicode character \u2581
#' @param x a character vector
#' @return \code{x} where the prefixed underscore is removed
#' @export
#' @examples
#' x <- c("\u2581word", "hello", "_regularunderscore")
#' x
#' txt_remove_(x)
txt_remove_ <- function(x){
  gsub("^\u2581", "", x)
}
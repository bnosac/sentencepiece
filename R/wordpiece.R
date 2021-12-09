

       


#' @title Wordpiece encoding
#' @description Wordpiece encoding, usefull for BERT-style tokenisation. 
#' Experimental version mimicing class WordpieceTokenizer from \url{https://github.com/huggingface/transformers/blob/master/src/transformers/models/bert/tokenization_bert.py}
#' @param x a character vector with text which can be splitted based on white space to obtain words
#' @param vocabulary a character vector of the vocabulary
#' @param type a character string, either 'subwords' or 'ids' to get the subwords or the corresponding ids of these subwords as defined in the vocabulary of the model. 
#' Defaults to 'subwords'.
#' @param unk_token character string with a value for a token which is not part of the vocabulary. Defaults to '[UNK]'
#' @param max_input_chars_per_word integer. A word which is longer than this specified number of characters will be set to the unknown token.
#' @return a list of subword tokens
#' @export
#' @examples
#' wordpiece_encode("unaffable", vocabulary = c("un", "##aff", "##able")) 
#' wordpiece_encode(x = c("unaffable", "unaffableun"), 
#'                  vocabulary = c("un", "##aff", "##able"))
#' wordpiece_encode(x = c("unaffable", "unaffableun", "unknown territory"), 
#'                  vocabulary = c("un", "##aff", "##able", "##un")) 
#' wordpiece_encode(x = c("unaffable", "unaffableun", "unknown territory"), 
#'                  vocabulary = c("un", "##aff", "##able", "##un"),
#'                  type = "ids") 
wordpiece_encode <- function(x, vocabulary = character(), type = c("subwords", "ids"), unk_token = "[UNK]", max_input_chars_per_word = 100L){
  type <- match.arg(type)
  max_input_chars_per_word <- as.integer(max_input_chars_per_word)
  unk_token <- as.character(unk_token)
  vocabulary <- as.character(vocabulary)
  x <- as.character(x)
  x <- trimws(x)
  x <- strsplit(x, " ")
  x <- lapply(x, FUN = function(terms){
    subwords <- lapply(terms, FUN=function(term) wordpiece_encode_as_subwords(term, vocabulary, unk_token, max_input_chars_per_word))
    subwords <- unlist(subwords, use.names = FALSE)
    subwords
  })
  if(type == "ids"){
    x <- lapply(x, FUN = function(x){
      match(x, vocabulary) - 1L
    })
  }
  x
}


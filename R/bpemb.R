bpemb_download_model <- function(language, vocab_size, dim, 
                                         model_dir = system.file(package = "sentencepiece", "models")){
  # vocab <- "https://nlp.h-its.org/bpemb/nl/nl.wiki.bpe.vs200000.vocab"
  # model <- "https://nlp.h-its.org/bpemb/nl/nl.wiki.bpe.vs200000.model"
  base_url = "https://nlp.h-its.org/bpemb/"
  emb_tpl = "{lang}/{lang}.wiki.bpe.vs{vs}.d{dim}.w2v.bin"
  model_tpl = "{lang}/{lang}.wiki.bpe.vs{vs}.model"
  archive_suffix = ".tar.gz"
  #available_languages = wikicode
  
  kSpaceSymbol = "\xe2\x96\x81"
  Encoding(kSpaceSymbol) <- "UTF-8"
  
}

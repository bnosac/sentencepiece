% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bpemb.R
\name{predict.BPEembed}
\alias{predict.BPEembed}
\title{Encode and Decode alongside a BPEembed model}
\usage{
\method{predict}{BPEembed}(object, newdata, type = c("encode", "decode", "tokenize"), ...)
}
\arguments{
\item{object}{an object of class BPEembed as returned by \code{\link{BPEembed}}}

\item{newdata}{a character vector of text to encode or a character vector of encoded tokens to decode or a list of those}

\item{type}{character string, either 'encode', 'decode' or 'tokenize'}

\item{...}{further arguments passed on to the methods}
}
\value{
\itemize{
\item{in case type is set to \code{'encode'}: a list of matrices containing embeddings of the text which is tokenised with \code{\link{sentencepiece_encode}}}
\item{in case type is set to \code{'decode'}: a character vector of decoded text as returned by \code{\link{sentencepiece_decode}}}
\item{in case type is set to \code{'tokenize'}: a tokenised \code{\link{sentencepiece_encode}}}
}
}
\description{
Use the sentencepiece model to either
\itemize{
\item{encode: tokenise and embed text}
\item{decode: get the untokenised text back of tokenised data}
\item{tokenize: only tokenize alongside the sentencepiece model}
}
}
\examples{
embedding <- system.file(package = "sentencepiece", "models", 
                         "nl.wiki.bpe.vs1000.d25.w2v.bin")
model     <- system.file(package = "sentencepiece", "models", 
                         "nl.wiki.bpe.vs1000.model")    
encoder   <- BPEembed(model, embedding)  

txt      <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
              "On est d'accord sur le prix de la biere?")
values   <- predict(encoder, txt, type = "encode")  
str(values) 
values

txt <- rownames(values[[1]])
predict(encoder, txt, type = "decode") 
txt <- lapply(values, FUN = rownames) 
predict(encoder, txt, type = "decode") 
txt <- c("De eigendomsoverdracht aan de deelstaten is ingewikkeld.",
         "On est d'accord sur le prix de la biere?")
predict(encoder, txt, type = "tokenize", "subwords") 
predict(encoder, txt, type = "tokenize", "ids")  
}
\seealso{
\code{\link{BPEembed}}, \code{\link{sentencepiece_decode}}, \code{\link{sentencepiece_encode}}
}

# sentencepiece 

This repository contains an R package which is an Rcpp wrapper around the sentencepiece C++ library

- sentencepiece is an unsupervised tokeniser which allows to execute text tokenization using 
    - Byte Pair Encoding 
    - Unigrams
    - Words
    - Characters
- It is based on the paper *SentencePiece: A simple and language independent subword tokenizer and detokenizer for Neural Text Processing* [[Taku Kudo, John Richardson.](https://aclanthology.org/D18-2012/)]
- The sentencepiece C++ code is available at https://github.com/google/sentencepiece
    - This package currently wraps release v0.1.96
- This R package has similar functionalities as the R package https://github.com/bnosac/tokenizers.bpe

## Features

The R package allows you to 

- build a Byte Pair Encoding (BPE), Unigram, Char or Word model
- apply the model to encode text
- apply the model to decode ids back to text
- download pretrained sentencepiece models built on Wikipedia


## Installation

- For regular users, install the package from your local CRAN mirror `install.packages("sentencepiece")`
- For installing the development version of this package: `remotes::install_github("bnosac/sentencepiece")`

Look to the documentation of the functions

```{r}
help(package = "sentencepiece")
```

## Example on encoding / decoding with a pretrained model built on Wikipedia

```{r}
library(sentencepiece)
dl    <- sentencepiece_download_model("English", vocab_size = 50000)
model <- sentencepiece_load_model(dl$file_model)
model
```

```
Sentencepiece model
  size of the vocabulary: 50000
  model stored at: C:/Users/Jan/Documents/R/win-library/3.5/sentencepiece/models/en.wiki.bpe.vs50000.model
```

```{r}
txt <- c("Give me back my Money or I'll call the police.",
         "Talk to the hand because the face don't want to hear it any more.")
txt <- tolower(txt)
sentencepiece_encode(model, txt, type = "subwords")
```

```
[[1]]
 [1] "▁give"   "▁me"     "▁back"   "▁my"     "▁money"  "▁or"     "▁i"      "'"       "ll"      "▁call"   "▁the"    "▁police" "."      

[[2]]
 [1] "▁talk"    "▁to"      "▁the"     "▁hand"    "▁because" "▁the"     "▁face"    "▁don"     "'"        "t"        "▁want"    "▁to"      "▁hear"    "▁it"      "▁any"     "▁more"    "."
```

```{r}
sentencepiece_encode(model, txt, type = "ids")
```

```
[[1]]
 [1]  3090   352   810  1241  2795   127   386 49937  1188   612     7  2142 49935

[[2]]
 [1]  4252    42     7  1197   936     7  3227  1616 49937 49915  4451    42  6800   107   756   407 49935
```


## Example on training

- As an example, let's take some training data containing questions asked in Belgian Parliament in 2017 and focus on French text only.


```{r}
library(tokenizers.bpe)
library(sentencepiece)
data(belgium_parliament, package = "tokenizers.bpe")
x <- subset(belgium_parliament, language == "french")
writeLines(text = x$text, con = "traindata.txt")
```

- Train a model on text data and inspect the vocabulary


```{r}
model <- sentencepiece("traindata.txt", type = "bpe", coverage = 0.999, vocab_size = 5000, 
                       model_dir = getwd(), verbose = FALSE)
model
```  

```
Sentencepiece model
  size of the vocabulary: 5000
  model stored at: sentencepiece.model
```

```{r}
str(model$vocabulary)
```

```
'data.frame':	5000 obs. of  2 variables:
 $ id     : int  0 1 2 3 4 5 6 7 8 9 ...
 $ subword: chr  "<unk>" "<s>" "</s>" "es" ...
```


- Use the model to encode text


```{r}
text <- c("L'appartement est grand & vraiment bien situe en plein centre",
          "Proportion de femmes dans les situations de famille monoparentale.")
sentencepiece_encode(model, x = text, type = "subwords")
```

```
[[1]]
 [1] "▁L"      "'"       "app"     "ar"      "tement"  "▁est"    "▁grand"  "▁"       "&"       "▁v"      "r"       "ai"      "ment"    "▁bien"   "▁situe"  "▁en"     "▁plein"  "▁centre"

[[2]]
 [1] "▁Pro"        "por"         "tion"        "▁de"         "▁femmes"     "▁dans"       "▁les"        "▁situations" "▁de"         "▁famille"    "▁mon"        "op"          "ar"          "ent"         "ale"         "." 
```

```{r}
sentencepiece_encode(model, x = text, type = "ids")
```

```
[[1]]
 [1]   75 4951  252   31  461  109  960 4934    0   49 4941   34   32  585 4225   44 3356 1915

[[2]]
 [1] 1362 4159   25    9 2060   93   40 3825    9 2923  705  247   31   19  116 4953
```

- Use the model to decode byte pair encodings back to text


```{r}
x <- sentencepiece_encode(model, x = text, type = "ids")
sentencepiece_decode(model, x)
```

```
[[1]]
[1] "L'appartement est grand  ⁇  vraiment bien situe en plein centre"

[[2]]
[1] "Proportion de femmes dans les situations de famille monoparentale."
```

## Support in text mining

Need support in text mining?
Contact BNOSAC: http://www.bnosac.be


#include <Rcpp.h>
#include "sentencepiece_model.pb.h"
#include "sentencepiece_trainer.h"
#include "sentencepiece_processor.h"

// [[Rcpp::export]]
std::string spc_train(std::string args) {
  //sentencepiece::TrainerSpec trainer_spec;
  //sentencepiece::NormalizerSpec normalizer_spec;  
  //sentencepiece::SentencePieceTrainer::Train(trainer_spec, normalizer_spec)
  sentencepiece::SentencePieceTrainer::Train(args);
  return args;
}


// [[Rcpp::export]]
Rcpp::List spc_load_model(std::string file) {
  Rcpp::XPtr<sentencepiece::SentencePieceProcessor> processor(new sentencepiece::SentencePieceProcessor(), true);
  const auto status = processor->Load(file);
  if (!status.ok()) {
    Rcpp::stop(status.ToString());
  }
  int vocab_size;
  std::vector<int> id;
  std::vector<std::string> vocab;
  vocab_size = processor->GetPieceSize();
  for (int i = 0; i < vocab_size; i++){
    vocab.push_back(processor->IdToPiece(i));
    id.push_back(i);
  }
  Rcpp::List out = Rcpp::List::create(
    Rcpp::Named("model") = processor,
    Rcpp::Named("model_path") = file,
    Rcpp::Named("vocab_size") = vocab_size,
    Rcpp::Named("vocabulary") = Rcpp::DataFrame::create(
      Rcpp::Named("id") = id,
      Rcpp::Named("subword") = vocab,
      Rcpp::Named("stringsAsFactors") = false)
  );
  return out;
}

// [[Rcpp::export]]
std::vector<std::vector<std::string>> spc_encode_as_subwords(SEXP model, const std::vector<std::string>& x) {
  Rcpp::XPtr<sentencepiece::SentencePieceProcessor> processor(model);
  
  std::vector<std::vector<std::string>> x_encoded;
  for (unsigned int i = 0; i < x.size(); i++){
     std::vector<std::string> pieces;
     processor->Encode(x[i], &pieces);
     x_encoded.push_back(pieces);
  }
  return x_encoded;
}


// [[Rcpp::export]]
std::vector<std::vector<int>> spc_encode_as_ids(SEXP model, const std::vector<std::string>& x) {
  Rcpp::XPtr<sentencepiece::SentencePieceProcessor> processor(model);
  
  std::vector<std::vector<int>> x_encoded;
  for (unsigned int i = 0; i < x.size(); i++){
    std::vector<int> ids;
    processor->Encode(x[i], &ids);
    x_encoded.push_back(ids);
  }
  return x_encoded;
}


// [[Rcpp::export]]
std::string spc_decode_ids(SEXP model, const std::vector<int>& x) {
  Rcpp::XPtr<sentencepiece::SentencePieceProcessor> processor(model);
  std::string text;
  processor->Decode(x, &text);
  return text;
}

// [[Rcpp::export]]
std::string spc_decode_subwords(SEXP model, const std::vector<std::string>& x) {
  Rcpp::XPtr<sentencepiece::SentencePieceProcessor> processor(model);
  std::string text;
  processor->Decode(x, &text);
  return text;
}

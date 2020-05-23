#include <Rcpp.h>


// [[Rcpp::export]]
Rcpp::StringVector wordpiece_encode_as_subwords(std::string x, std::vector<std::string> vocabulary, std::string unk_token="[UNK]", unsigned int max_input_chars_per_word=100) {
  // Tokenizes a piece of text into its word pieces, using a greedy longest-match-first algorithm to perform tokenization
  Rcpp::StringVector output_tokens;
  unsigned int len = x.length() - 1;
  if(len > max_input_chars_per_word){
    output_tokens.push_back(unk_token);
  }else{
    unsigned int start = 0;
    std::vector<std::string> sub_tokens;
    
    while(start < len){
      unsigned int end = len;
      std::string cur_substr = "";
      std::string substr;
      while(start < end){
        substr = x.substr(start, end - start + 1);
        //Rcpp::Rcout << substr << ":" << start << "-" << end <<"\n";
        if(start > 0){
          substr = "##" + substr;
        }
        if(std::find(vocabulary.begin(), vocabulary.end(), substr) != vocabulary.end()){
          cur_substr = substr;
          break;
        }
        end = end - 1;
      }
      if(cur_substr == ""){
        sub_tokens.push_back(unk_token);
        break;
      }
      sub_tokens.push_back(cur_substr);
      start = end + 1;
    }
    if(sub_tokens.size() == 0){
      output_tokens.push_back(unk_token);
    }else{
      for (unsigned int i = 0; i < sub_tokens.size(); i++){
        output_tokens.push_back(sub_tokens[i]);
      }
    }
  }
  return output_tokens;
}
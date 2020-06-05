## CHANGES IN sentencepiece VERSION 0.1.2

- Fix Solaris installation issue which used log of uint64 which is not defined on Solaris
- Fix Solaris installation issue related to incorrect usage of pointer as a function 

## CHANGES IN sentencepiece VERSION 0.1.1

- Added verbose argument in sentencepiece

## CHANGES IN sentencepiece VERSION 0.1.0

- Initial package based on https://github.com/google/sentencepiece release v0.1.84 commit  2424d82d396b43b2556203c592e48a621ef10f3c
- Third-party code from https://github.com/google/sentencepiece/tree/master/third_party is put in src/absl, src/esaxx, src/darts_clone, src/protobuf-lite

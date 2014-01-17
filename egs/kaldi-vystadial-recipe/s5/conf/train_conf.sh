#!/bin/bash



data_lang=cs  # alternatives cs|en
export DATA_ROOT=/ha/projects/vystadial/data/asr/${data_lang}/voip

export test_sets="dev test"

export LM_ORDER=2
# Unset or empty ARPA_MODEL variable means that the script will build the LM itself
export ARPA_MODEL="$DATA_ROOT/arpa_bigram"
# unset ARPA_MODEL

# Should I create and use 0-gram LM for decoding from testing data?
export TEST_ZERO_GRAMS="yes"
# unset TEST_ZERO_GRAMS


# Unset or empty DICTIONARY -> DICTIONARY is built from data
# export DICTIONARY="/ha/projects/vystadial/git/alex/resources/lm/caminfo/dict"
unset DICTIONARY

# Settings for LM model weight tuned on development set and applied on test set.
[ $data_lang == "cs" ]  && min_lmw=4 && max_lmw=15
[ $data_lang == "en" ]  && min_lmw=9 && max_lmw=20

# Storage dir for MFCC. Need a lot of space.
export MFCC_DIR="./mfcc"

# EveryN utterance is used for training 
# everyN=3    ->   we use one third of data
everyN=1

# Number of utterances used for training monophone models:
# monoTrainData=150
unset monoTrainData  # use full data

# Number of states for phonem training
pdf=1200

# Maximum number of Gaussians used for training
gauss=19200

# Cepstral Mean Normalisation: true/false
cmn=false

train_mmi_boost=0.05

#!/bin/bash
set -e #prevents script from continuing if it encounters a mistake
#set up some basic path definitions
LOCAL_HOME="/Users/adam/testDir"
HMM_PATH="modules/hmm_modules"
SS_PATH="modules/ss_modules"
SIG_PATH="modules/signal_modules"
HELP_PATH="module_help"

#create folder structure
mkdir -p modules/{hmm_modules,ss_modules,signal_modules}
mkdir -p modules/hmm_modules/hmmX
mkdir  module_help
mkdir workspaces

#helper modules
cd "$LOCAL_HOME/$HELP_PATH"
git clone https://github.com/awillats/StAC_rtxi.git
https://github.com/eigenteam/eigen-git-mirror.git
mv eigen-git-mirror eigen

#get the step by step instructions for this from michael
#git clone https://github.com/mfbolus/cpp-dynCtrlEst.git
#git clone https://github.com/mfbolus/StanleyRTXI.git

cd "$LOCAL_HOME/$HMM_PATH"
git clone https://github.com/awillats/rtxi_hmm_decoder.git
git clone https://github.com/awillats/rtxi_hmm_generator.git
git clone https://github.com/awillats/hmm.git hmmX

cd "$LOCAL_HOME/$SS_PATH"
git clone https://github.com/awillats/ss_ctrl.git
git clone https://github.com/awillats/ss_obsv.git
git clone https://github.com/awillats/ss_plant.git

cd "$LOCAL_HOME/$SIG_PATH"
git clone https://github.com/awillats/quantizer.git
git clone https://github.com/awillats/gain_mod.git
git clone https://github.com/awillats/limiter.git
git clone https://github.com/awillats/nonlin_spike.git






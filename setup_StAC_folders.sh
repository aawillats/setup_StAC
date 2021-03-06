#!/bin/bash
set -e #prevents script from continuing if it encounters a mistake
#set up some basic path definitions

echo "Please make sure youve double checked the LOCAL_HOME path in this setup script!"
echo "if this script errors, try running reset_StAC_folders.sh before retrying"

LOCAL_HOME="/home/adam/RTXI"

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
git clone https://github.com/eigenteam/eigen-git-mirror.git
mv eigen-git-mirror eigen
cd eigen
git checkout branches/3.3
cd ..

git clone https://github.com/awillats/hmm.git hmmX/hmm

#get the step by step instructions for this from michael
#git clone https://github.com/mfbolus/cpp-dynCtrlEst.git
#git clone https://github.com/mfbolus/StanleyRTXI.git

cd "$LOCAL_HOME/$HMM_PATH"
git clone https://github.com/awillats/rtxi_hmm_decoder.git
git clone https://github.com/awillats/rtxi_hmm_generator.git


cd "$LOCAL_HOME/$SS_PATH"
git clone https://github.com/awillats/ss_ctrl.git
git clone https://github.com/awillats/ss_obsv.git
git clone https://github.com/awillats/ss_plant.git

cd "$LOCAL_HOME/$SIG_PATH"
git clone https://github.com/awillats/quantizer.git
git clone https://github.com/awillats/gain_mod.git
git clone https://github.com/awillats/limiter.git
git clone https://github.com/awillats/nonlin_spike.git






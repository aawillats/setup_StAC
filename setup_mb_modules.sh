#!/bin/bash
#set -e #this will unfortunately fail @ cloning rtxi
LOCAL_HOME="/home/adam/RTXI"
HELP_PATH="module_help"

cd "$LOCAL_HOME/$HELP_PATH"

git config --global credential.helper cache
git clone https://github.com/mfbolus/StanleyRTXI.git

cd StanleyRTXI
./getSubmodules.sh

git clone https://github.com/mfbolus/cpp-dynCtrlEst
cd cpp-dynCtrlEst

./getArmadillo.sh
./install_matio.sh
./makeArmadillo.sh


cd ..
git config --global credential.helper cache
./makeModules.sh

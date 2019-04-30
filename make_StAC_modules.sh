#!/bin/bash

exec >  >(tee -i makeReport.log)
exec 2> >(tee -i makeReport.log >&2)
#https://stackoverflow.com/questions/3173131/redirect-copy-of-stdout-to-log-file-from-within-bash-script-itself

DOCLEAN=${1:--1};
#defaults var to -1 unless set via input argument

#alias makeinstall='make clean; make; sudo make install;'
echo "$DOCLEAN"
if [[ "$DOCLEAN" == -1 ]];
then
   echo "note: making without cleaning"
   makeinstall() {
   pwd
   #make 
   #sudo make install
   }

else
   makeinstall() {
   sudo make clean
   make 
   sudo make install
   }

fi


cd modules/hmm_modules
cd rtxi_hmm_decoder
makeinstall

cd ../rtxi_hmm_generator
makeinstall

cd ../../ss_modules
cd ss_ctrl
makeinstall
#cd ../ss_obsv
#makeinstall
cd ../ss_plant
makeinstall

cd ../../signal_modules
cd gain_mod
makeinstall
cd ../limiter
makeinstall
cd ../nonlin_spike
makeinstall
cd ../quantizer
makeinstall



cd ../../..

#restate the highlights of the log file
grep -i "fatal" makeReport.log
grep -i "error" makeReport.log
grep -i "warning" makeReport.log





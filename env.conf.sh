#! /bin/bash

bld=$(tput bold)
nrm=$(tput sgr0)
myemail="dschirita@gmail.com"
EXITCODE=0

source ./gitconfig.sh
source ./emacsconfig.sh
# source ./bashconfig.sh
source ./zshconfig.sh
source ./jupconfig.sh
source ./xdgconfig.sh
source ./tlpconfig.sh

################################  MAIN  ################################

printf "\nInitializing configuration...\n"

gitConfig
emacsConfig    
# bashConfig
jupconfig
xdgconfig
zshconfig
tlpconfig

printf "\nEnvironment configuration script exitting with exit code $EXITCODE.\n"



#! /bin/bash

bld=$(tput bold)
nrm=$(tput sgr0)
myemail="dschirita@gmail.com"
generalConsent="n"
blanketConsent="n"
gitConsent="n"
personalConsent="n"
emacsConsent="n"
tmuxConsent="n"
bashConsent="n"
notsame=1;
EXITCODE=0

source ./includeFns.sh || { printf "\n${bld}RUN ./env.conf.sh IN ITS DIR. includeFns.sh HAS TO BE IN THE SAME DIR.${nrm}"; exit 1; }

source ./gitconfig.sh
source ./emacsconfig.sh
source ./tmuxconfig.sh
source ./bashconfig.sh

################################  MAIN  ################################



greetings
askConsent

#generalConsent="Y"

if [ "$generalConsent" = "Y" ]
then
    printf "\nInitializing configuration...\n"

    if [ $gitConsent = "Y" ]; then 
	gitConfig
    fi

    if [ $emacsConsent = "Y" ]; then
	emacsConfig
    fi
    
    if [ $tmuxConsent = "Y" ]; then
	tmuxConfig
    fi

    if [ $bashConsent = "Y" ]; then
	bashConfig
    fi

else
    printf "\nEnvironment configuration aborted."
    EXITCODE=1
fi

printf "\nEnvironment configuration script exitting with exit code $EXITCODE.\n"



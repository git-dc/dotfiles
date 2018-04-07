#! /bin/bash

bld=$(tput bold)
nrm=$(tput sgr0)
myemail="dschirita@gmail.com"
generalConsent="n"
gitConsent="n"
personalConsent="n"
emacsConsent="n"
tmuxConsent="n"
notsame=1;
EXITCODE=0

source ./includeFns.sh || { printf "\n${bld}RUN ./env.conf.sh IN ITS DIR. includeFns.sh HAS TO BE IN THE SAME DIR.${nrm}"; exit 1; }


################################  MAIN  ################################



greetings
askConsent

#generalConsent="Y"

if [ "$generalConsent" != "N" ]
then
    printf "\nInitializing configuration...\n"

    if [ $gitConsent != "N" ]
    then 
	gitConfig
    fi

    if [ $emacsConsent != "N" ]
    then
	emacsConfig
    fi
    
    if [ $tmuxConsent != "N" ]
    then
	tmuxConfig
    fi

else
    printf "\nEnvironment configuration aborted."
    EXITCODE=1
fi

printf "\nEnvironment configuration script exitting with exit code $EXITCODE.\n"



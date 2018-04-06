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

source ./includeFns.sh


################################  MAIN  ################################



greetings
askConsent

#generalConsent="Y"

if [ "$generalConsent" = "Y" ]
then
    printf "\nInitializing configuration...\n"

    if [ $gitConsent = "Y" ]
    then 
	gitConfig
    fi

    if [ $emacsConsent = "Y" ]
    then
	emacsConfig
    fi
    if [ $tmuxConsent = "Y" ]
    then
	tmuxConfig
    fi

else
    printf "\nEnvironment configuration aborted."
    EXITCODE=1
fi

printf "\nEnvironment configuration script exitting with exit code $EXITCODE.\n"



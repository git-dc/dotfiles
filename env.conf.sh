#! /bin/bash

bld=$(tput bold)
nrm=$(tput sgr0)
myemail="dschirita@gmail.com"
generalConsent="n"
personalConsent="n"

EXITCODE=0

function greetings {
printf """Greetings, $USER! 

This script will set up key elements of DC's work environment. The following packages will be installed and configured: ${bld}emacs, git, tmux${nrm}.

For successful execution, the script may require at various points: ${bld}apt-get, sudo${nrm}.\n"""
}


function askConsent {
    printf "\nSet up the environment? (Y/n) "
    read generalConsent # uncomment this line to use the script
    #generalConsent="y"  # dev purposes, comment out to use the script.
    generalConsent=${generalConsent^^}
    printf "\nPersonalize the environment (do not agree if you did not write this code)? (Y/n) "
    read personalConsent # uncomment this line to use the script
    #personalConsent="y" # dev purposes, comment out to use the script.
    personalConsent=${personalConsent^^}

}


function gitConfig {
    printf "\n${bld}git config...${nrm}\n\n"
    command -v git >/dev/null 2>&1 && {
	echo >&2 "Git is not installed. Installing git...";
	echo "running 'sudo apt-get install git'";
    } #sudo apt-get install git; }
    printf "\nOriginal git settings can be found in ./.gitconfig.orig\n"
    git config --list > .gitconfig.orig
    printf "\nMaking changes to ~/.gitconfig ...\n"
    if [ personalConsent = "Y" ];
       then
	   git config --global user.name "Daniel Chirita"
	   git config --global user.email $myemail

    fi

    git config --global core.editor emacs -nw
    git config --global format.pretty oneline
    git config --global color.ui true
    
    #printf "\nGit settings after configuration: \n"
    #git config --list
    printf "\n${bld}git config done.${nrm}\n\n"

}

function emacsConfig {
    printf "\n${bld}emacs config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 && {
	echo >&2 "Emacs is not installed. Installing emacs...";
	echo "running 'sudo apt-get install git'";
    } #sudo apt-get install emacs; }
    printf "\nOriginal emacs settings can be found in ./emacs.init.el.orig\n"
    cp /home/$USER/.emacs.d/init.el ./emacs.init.el.orig
    
    printf "\nMaking changes to ~/.emacs.d/init.el ...\n"
    cp ./emacs.init.el /home/$USER/.emacs.d/init.el

    printf "\n${bld}emacs config done.${nrm}\n"

}


function tmuxConfig {
    printf "\n${bld}tmux config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 && {
	echo >&2 "Tmux is not installed. Installing tmux...";
	echo "running 'sudo apt-get install tmux'";
    } #sudo apt-get install tmux; }
    printf "\nOriginal tmux settings can be found in ./tmux.conf.orig\n"
    cp /home/$USER/.tmux.conf ./tmux.conf.orig
    
    printf "\nMaking changes to ~/.tmux.conf ...\n"
    cp ./tmux.conf /home/$USER/.tmux.conf

    printf "\n${bld}tmux config done.${nrm}\n"


}


################################################  MAIN  ################################################



greetings
askConsent

if [ $generalConsent = "Y" ];
then
    #printf "\n${bld}$USER says yes!${nrm}\n\n"
    printf "Initializing configuration...\n"

    gitConfig
    emacsConfig
    tmuxConfig
    
else
    printf "\nEnvironment configuration aborted."
    $EXITCODE=1
fi
    printf "\nEnvironment configuration script exitting with code $EXITCODE.\n"

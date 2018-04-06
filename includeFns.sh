function greetings {
printf """Greetings, $USER! 

This script will set up key elements of DC's work environment. The following packages will be installed and configured: ${bld}emacs, git, tmux${nrm}.

For successful execution, the script may require at various points: ${bld}apt-get, sudo${nrm}.\n"""
}


function askConsent {
    printf "Set up the environment? (Y/n) "
    read generalConsent # uncomment this line to use the script
    #generalConsent="y"  # dev purposes, comment out to use the script.
    generalConsent=${generalConsent^^}


    printf "Configure git? (Y/n) "
    read gitConsent # uncomment this line to use the script
    #personalConsent="y" # dev purposes, comment out to use the script.
    gitConsent=${gitConsent^^}

    if [ $gitConsent = "Y" ]
    then
	printf "Personalize git (do not agree if you did not write this code)? (Y/n) "
	read personalConsent # uncomment this line to use the script
	#personalConsent="y" # dev purposes, comment out to use the script.
	personalConsent=${personalConsent^^}
    fi

    printf "Configure emacs? (Y/n) "
    read emacsConsent # uncomment this line to use the script
    #personalConsent="y" # dev purposes, comment out to use the script.
    emacsConsent=${emacsConsent^^}

    printf "Configure tmux? (Y/n) "
    read tmuxConsent # uncomment this line to use the script
    #personalConsent="y" # dev purposes, comment out to use the script.
    tmuxConsent=${tmuxConsent^^}
    
}

function areSame {
    if cmp --silent "$1" "$2";
    then

	printf "No changes required.\n"
	notsame=0
    else

	printf "Making changes to "
	notsame=1
    fi
}


function gitConfig {
    printf "\n${bld}git config...${nrm}\n\n"
    command -v git >/dev/null 2>&1 || {
	echo >&2 "Git is not installed. Installing git...";
	echo "running 'sudo apt-get install git'";
	sudo apt-get install git; }

    if [ "$personalConsent" = "Y" ]
    then
	areSame /home/$USER/.gitconfig ./gitconfig
	if [ "$notsame" = 1 ]
	then
	   printf " ~/.gitconfig ...\n"
	   printf "Original git settings can be found in ./.gitconfig.orig or ~/.gitconfig.orig\n"
	   cp /home/$USER/.gitconfig /home/$USER/.gitconfig.orig
	   cp ./gitconfig home/$USER/.gitconfig
	fi
    else
    
	git config --global core.editor "emacs -nw"
	git config --global format.pretty oneline
	git config --global color.ui true
    fi
    printf "\n${bld}git config done.${nrm}\n\n"    
}

function emacsConfig {
    printf "\n${bld}emacs config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 || {
	echo >&2 "Emacs is not installed. Installing emacs...";
	echo "running 'sudo apt-get install emacs";
	sudo apt-get install emacs; }
    areSame /home/$USER/.emacs.d/init.el ./emacs.init.el
    if [ "$notsame" = 1 ]
    then
	printf "~/.emacs.d/init.el ...\n"
	printf "Original emacs settings can be found in ./emacs.init.el.orig or in ~/.emacs.d/init.el.orig\n"
	cp /home/$USER/.emacs.d/init.el ./emacs.init.el.orig
	cp /home/$USER/.emacs.d/init.el /home/$USER/.emacs.d/init.el.orig
        cp ./emacs.init.el /home/$USER/.emacs.d/init.el
    fi
    printf "\n${bld}emacs config done.${nrm}\n"
}


function tmuxConfig {
    printf "\n${bld}tmux config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 || {
	echo >&2 "Tmux is not installed. Installing tmux...";
	echo "running 'sudo apt-get install tmux'";
	sudo apt-get install tmux; }
    areSame /home/$USER/.tmux.conf ./tmux.conf
    if [ "$notsame" = 1 ]
    then
	printf "~/.tmux.conf ...\n"
	printf "\nOriginal tmux settings can be found in ./tmux.conf.orig\n or in ~/.tmux.conf.orig\n"
	cp /home/$USER/.tmux.conf ./tmux.conf.orig
	cp /home/$USER/.tmux.conf /home/$USER/tmux.conf.orig
	cp ./tmux.conf /home/$USER/.tmux.conf
    fi
    printf "\n${bld}tmux config done.${nrm}\n"


}

function gitConfig {
    printf "\n${bld}git config...${nrm}\n\n"
    command -v git >/dev/null 2>&1 || {
	echo >&2 "Git is not installed. Installing git...";
	echo "running 'sudo apt-get install git'";
	sudo apt-get install git; }
    
    if [ "$personalConsent" = "Y" ]
    then
#	areSame /home/$USER/.gitconfig ./gitconfig
#	if [ "$notsame" = 1 ]
#	then
	    printf " ~/.gitconfig ...\n"
	    printf "Original git settings can be found in ./origs/gitconfig.orig or ~/.gitconfig.orig\n"
	    if [ -f /home/$USER/.gitconfig ]; then
		cp /home/$USER/.gitconfig /home/$USER/.gitconfig.orig
		mv /home/$USER/.gitconfig ./origs/gitnfig.orig
#		rm /home/$USER/.gitconfig
	    fi
	    
	    ln ./templates/gitconfig /home/$USER/.gitconfig
#	fi
    else
	
	git config --global core.editor "emacs -nw"
	git config --global format.pretty oneline
	git config --global color.ui true
    fi
    printf "\n${bld}git config done.${nrm}\n\n"    
}

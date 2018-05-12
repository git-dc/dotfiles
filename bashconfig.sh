function bashConfig {
    printf "\n${bld}bash config...${nrm}\n\n"
#    areSame /home/$USER/.bashrc ./bashrc
#    if [ "$notsame" = 1 ]
#    then
	printf " ~/.bashrc and ~/.bash_aliases ...\n"
	printf "Original bash settings can be found in ./origs/bashrc.orig or ~/.bashrc.orig\n"
	if [ -f /home/$USER/.bashrc ]; then
	    cp /home/$USER/.bashrc /home/$USER/.bashrc.orig
	    mv /home/$USER/.bashrc ./origs/bashrc.orig
#	    rm /home/$USER/.bashrc
	fi
	
	if [ -f /home/$USER/.bash_aliases ]; then
	    cp /home/$USER/.bash_aliases /home/$USER/.bash_aliases.orig
	    mv /home/$USER/.bash_aliases ./origs/bash_aliases.orig
#	    rm /home/$USER/.bash_aliases
	fi
	
	ln ./templates/bashrc /home/$USER/.bashrc
	ln ./templates/bash_aliases /home/$USER/.bash_aliases
#    fi
}


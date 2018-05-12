function tmuxConfig {
    printf "\n${bld}tmux config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 || {
	echo >&2 "Tmux is not installed. Installing tmux...";
	echo "running 'sudo apt-get install tmux'";
	sudo apt-get install tmux; }
#    areSame /home/$USER/.tmux.conf ./tmux.conf
#    if [ "$notsame" = 1 ]
#    then
	printf "~/.tmux.conf ...\n"
	printf "\nOriginal tmux settings can be found in ./origs/tmux.conf.orig\n or in ~/.tmux.conf.orig\n"
	if [ -f /home/$USER/.tmux.conf ]; then
	    cp /home/$USER/.tmux.conf /home/$USER/.tmux.conf.orig
	    mv /home/$USER/.tmux.conf ./origs/tmux.conf.orig
#	    rm /home/$USER/.tmux.conf
	fi    
	ln ./templates/tmux.conf /home/$USER/.tmux.conf

#    fi
    printf "\n${bld}tmux config done.${nrm}\n"
}

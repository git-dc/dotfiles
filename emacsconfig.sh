function emacsConfig {
    printf "\n${bld}emacs config...${nrm}\n\n"
    command -v emacs >/dev/null 2>&1 || {
	echo >&2 "Emacs is not installed. Installing emacs...";
	echo "running 'sudo apt-get install emacs";
	sudo apt-get install emacs-nox; }
#    areSame /home/$USER/.emacs.d/init.el ./emacs.init.el
#    if [ "$notsame" = 1 ]
#    then
	printf "~/.emacs.d/init.el ...\n"
	printf "Original emacs settings can be found in ./origs/emacs.init.el.orig or in ~/.emacs.d/init.el.orig\n"
	if [ -f /home/$USER/.emacs.d/init.el ]; then
	    cp /home/$USER/.emacs.d/init.el /home/$USER/.emacs.d/init.el.orig
	    mv /home/$USER/.emacs.d/init.el ./origs/emacs.init.el.orig
#	    rm /home/$USer/.emacs.d/init.el
        fi

	if [ /home/$USER/.emacs.d ]; then
	    echo ""
	else
	    mkdir /home/$USER/.emacs.d
	fi
        ln -sb ./templates/emacs.init.el /home/$USER/.emacs.d/init.el
#    fi
    printf "\n${bld}emacs config done.${nrm}\n"
}

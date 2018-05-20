function xdgConfig {
    printf "\n${bld}xdg.dirs config...${nrm}\n\n"
#    command -v emacs >/dev/null 2>&1 || {
#	echo >&2 "Tmux is not installed. Installing tmux...";
#	echo "running 'sudo apt-get install tmux'";
#	sudo apt-get install tmux; }
#    areSame /home/$USER/.tmux.conf ./tmux.conf
#    if [ "$notsame" = 1 ]
#    then
#	printf "~/.tmux.conf ...\n"
    printf "\nOriginal xdg default dirs settings can be found in ./origs/user-dirs.defaults.orig or in /etc/xdg/user-dirs.defaults.orig\n"
    if [ -f /etc/xdg/user-dirs.defaults ]; then
	sudo cp /etc/xdg/user-dirs.defaults /etc/xdg/user-dirs.defaults.orig
	mv /etc/xdg/user-dirs.defaults ./origs/user-dirs.defaults.orig
    fi    
    sudo ln -sb ./templates/user-dirs.defaults /etc/xdg/user-dirs.defaults

#    fi
    xdg-user-dirs-update --set DESKTOP /home/dc/desktop
    xdg-user-dirs-update --set DOWNLOAD /home/dc/pulls
    xdg-user-dirs-update --set PUBLICSHARE /home/dc/shared
    xdg-user-dirs-update --set DOCUMENTS /home/dc/work
    xdg-user-dirs-update --set MUSIC /home/dc/media/music
    xdg-user-dirs-update --set VIDEOS /home/dc/media/videos
    xdg-user-dirs-update --set PICTURES /home/dc/media/pictures
    #xdg-user-dirs-update --set TEMPLATES /home/dc/templs
    printf "\n${bld}user dirs config done.${nrm}\n"
}

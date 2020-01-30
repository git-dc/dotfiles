function gitconfig {
    printf "\n${bld}git config...${nrm}\n\n"
    command -v git >/dev/null 2>&1 || {
	echo >&2 "Git is not installed. Installing git...";
	echo "running 'sudo apt-get install git'";
	sudo apt-get install git; }
    
    printf " ~/.gitconfig ...\n"
    printf "Original git settings can be found in /home/$USER/.gitconfig~\n"
    
    ln -sb $PWD/templates/gitconfig /home/$USER/.gitconfig
    git config --global core.editor "emacs -nw"
    git config --global format.pretty oneline
    git config --global color.ui true
    
    printf "\n${bld}git config done.${nrm}\n\n"    
}

function bashconfig {
    printf "\n${bld}bash config...${nrm}\n\n"
    printf " ~/.bashrc and ~/.bash_aliases will be replaced with links to dc config\n"
    printf "Original bash settings can be found in /home/$USER/.bashrc~ and /home/$USER/.bash_aliases~\n"	

    ln -sb $PWD/templates/bashrc /home/$USER/.bashrc
    ln -sb $PWD/templates/bash_aliases /home/$USER/.bash_aliases

    printf "\n${bld}bash config done.${nrm}\n"
}


function zshconfig {
    printf "\n${bld}zsh config...${nrm}\n\n"
    printf " ~/.zshrc and ~/.zsh_aliases will be replaced with links to the corresponding files in ~/.dotfiles/templates/\n"
    printf "Original zsh settings can be found in /home/$USER/.zshrc~ and /home/$USER/.zsh_aliases~\n"	

    ln -sb $PWD/templates/zshrc /home/$USER/.zshrc
    ln -sb $PWD/templates/zsh_aliases /home/$USER/.zsh_aliases
    
    printf "\n${bld}zsh config done.${nrm}\n"
}

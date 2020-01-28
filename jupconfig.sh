function jupconfig {
    printf "\n${bld}jupyter config...${nrm}\n\n"
    printf "\n"
    sudo pacman -Syu
    sudo pacman -S python-pip jupyter-notebook base-devel
    
    sudo ln -sb $PWD/templates/jupyter.service /etc/systemd/system/jupyter.service
    
    sudo systemctl enable jupyter.service
    sudo systemctl daemon-reload
    sudo systemctl restart jupyter.service
    printf "\n${bld}jupyter config done.${nrm}\n"
}

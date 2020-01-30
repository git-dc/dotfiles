function powertopconfig {
    printf "\n${bld} applying powertop recommended config...${nrm}\n\n"
    sudo pacman -Syu
    sudo pacman -S powertop
    
    sudo ln -sb $PWD/templates/powertop.service /etc/systemd/system/powertop.service
    
    sudo systemctl enable powertop.service
    sudo systemctl daemon-reload
    sudo systemctl restart powertop.service

    printf "\n${bld}powertop config done.${nrm}\n"
}

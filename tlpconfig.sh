function tlpconfig {
    printf "\n${bld}tlp config...${nrm}\n\n"
    
    sudo pacman -Syu
    sudo pacman -S tlp
    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service
    sudo systemctl mask systemd-rfkill.socket
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl start tlp
    
    printf "\n${bld}tlp config done.${nrm}\n"
}

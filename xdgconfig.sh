function xdgconfig {
    printf "\n${bld}xdg.dirs config...${nrm}\n\n"

    sudo pacman -Syu
    sudo pacman -S xdg-user-dirs

    xdg-user-dirs-update --set DESKTOP /home/dc/desk
    xdg-user-dirs-update --set DOWNLOAD /home/dc/pulls
    xdg-user-dirs-update --set DOCUMENTS /home/dc/work
    xdg-user-dirs-update --set MUSIC /home/dc/media/music
    xdg-user-dirs-update --set VIDEOS /home/dc/media/videos
    xdg-user-dirs-update --set PICTURES /home/dc/media/pictures
    
    printf "\n${bld}user dirs config done.${nrm}\n"
}

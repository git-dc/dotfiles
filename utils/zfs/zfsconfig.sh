#! /bin/bash

# pikaur should be installed

sudo pacman -S --needed base-devel smartmontools
pikaur -S --needed dkms zfs-utils zfs-dkms

sudo systemctl enable zfs-import-cache
sudo systemctl enable zfs-mount
sudo systemctl enable zfs-import.target
sudo systemctl enable zfs.target
sudo systemctl start zfs.target
sudo modprobe zfs
sudo zpool status

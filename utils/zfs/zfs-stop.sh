#! /bin/bash


sudo systemctl stop zfs-scrub@bakpool.timer
sudo systemctl disable  zfs-scrub@bakpool.timer

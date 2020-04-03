#! /bin/bash


sudo systemctl stop zfs-scrub@<pool>.timer
sudo systemctl disable  zfs-scrub@<pool>.timer

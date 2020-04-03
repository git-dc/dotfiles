#! /bin/bash


sudo systemctl enable zfs-scrub@<pool>.timer
sudo systemctl start zfs-scrub@<pool>.timer

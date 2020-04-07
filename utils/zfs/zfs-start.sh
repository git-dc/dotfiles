#! /bin/bash


sudo systemctl enable zfs-scrub@bakpool.timer
sudo systemctl start zfs-scrub@bakpool.timer

#!/bin/bash

device=$(xinput | grep Touchpad | cut -f2 -d"=" | cut -f1 -d"[" | cut -f1 -d" ")
device="${device//[!0-9]/}"
state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

if [ $state == '1' ];then
  xinput --disable "$device"
else
  xinput --enable "$device"
fi	   	    

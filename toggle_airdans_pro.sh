#!/usr/bin/env bash


airdans="AC:C9:06:31:70:F9"
airdans_pro="14:28:76:D7:00:8E"
device=$airdans_pro

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device"
else
  bluetoothctl connect "$device"
fi

#!/usr/bin/env bash

device="AC:C9:06:31:70:F9"

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device"
else
  bluetoothctl connect "$device"
fi

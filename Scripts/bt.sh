#!/usr/bin/env bash

state=$(bluetoothctl show | grep -i "Powered:" | awk '{print $2}')

if [ "$state" == "yes" ]; then
    bluetoothctl power off
    notify-send "Bluetooth выключен"
else
    bluetoothctl power on
    notify-send "Bluetooth включен"
fi

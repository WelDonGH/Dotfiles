#!/usr/bin/env bash

state=$(powerprofilesctl get)

if [[ $state == "performance" ]]; then
    powerprofilesctl set balanced
    notify-send "Режим баланса"
elif [[ $state == "balanced" ]]; then
    powerprofilesctl set power-saver
    notify-send "Режим энергосбережения"
else
    powerprofilesctl set performance
    notify-send "Режим производительности"
fi

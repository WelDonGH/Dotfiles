#!/usr/bin/env bash

state=$(powerprofilesctl get)

if [[ $state == "performance" ]]; then
    powerprofilesctl set power-saver
    notify-send "Режим энергосбережения"
elif [[ $state == "balanced" ]]; then
    powerprofilesctl set performance
    notify-send "Режим производительности"
else
    powerprofilesctl set balanced
    notify-send "Режим баланса"
fi

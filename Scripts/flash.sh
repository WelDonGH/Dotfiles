#!/usr/bin/env bash

flash_dir="/run/media/weldon/"
kostyl=$(ls /run/media/)

while true; do
    devices=$(ls "$flash_dir" 2>/dev/null | grep -v '^$')

    if [ -n "$devices" ]; then
        flash_name="${kostyl##*/}"
        echo "Flash $flash_name"
    else
        echo "No flash"
    fi

    sleep 3
done

#!/usr/bin/env bash

LOCK_FILE="$HOME/Scripts/vpn.lock"

if [ ! -f "$LOCK_FILE" ]; then
    touch "$LOCK_FILE"
    echo "2281337qweasd" | sudo -S adguardvpn-cli connect -l FI
    notify-send VPN ON
else
    rm -rf "$LOCK_FILE"
    echo "2281337qweasd" | sudo -S adguardvpn-cli disconnect
    notify-send VPN OFF
fi

#!/bin/bash

CONTROLLER_VENDOR="057e"
CONTROLLER_PRODUCT="2009"
RECEIVER_VENDOR="2dc8"
RECEIVER_PRODUCT="310b"

launch_steam() {
    if pgrep -x steam >/dev/null; then
        return
    fi

    gaming on
    sleep 2
    steam -tenfoot &
}

quit_steam() {
    if pgrep -x steam >/dev/null; then
        pkill -TERM -x steam

        # Wait for Steam to close cleanly
        while pgrep -x steam >/dev/null; do
            sleep 1
        done

        gaming off
    fi
}

udevadm monitor --udev --subsystem-match=input --property | while read -r line; do

    # Controller connected
    if echo "$line" | grep -q "ID_VENDOR_ID=$CONTROLLER_VENDOR"; then
        C_VENDOR=1
    fi

    if echo "$line" | grep -q "ID_MODEL_ID=$CONTROLLER_PRODUCT"; then
        C_PRODUCT=1
    fi

    if [[ $C_VENDOR == 1 && $C_PRODUCT == 1 ]]; then
        launch_steam
        C_VENDOR=0
        C_PRODUCT=0
    fi

    # Controller docked
    if echo "$line" | grep -q "ID_VENDOR_ID=$RECEIVER_VENDOR"; then
        R_VENDOR=1
    fi

    if echo "$line" | grep -q "ID_MODEL_ID=$RECEIVER_PRODUCT"; then
        R_PRODUCT=1
    fi

    if [[ $R_VENDOR == 1 && $R_PRODUCT == 1 ]]; then
        quit_steam
        R_VENDOR=0
        R_PRODUCT=0
    fi

done

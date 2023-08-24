#!/usr/bin/env bash

declare -A exit_array=(
    [Close Session]='bspc quit'
    [Reboot]='shutdown -h -r now'
    [Shutdown]='shutdown -h now'
)

function gen_exit() {
    for option in "${!exit_array[@]}"; do
        echo "${option}"
    done
}

selection=$( gen_exit | rofi -dmenu )
eval "${exit_array[${selection}]}"



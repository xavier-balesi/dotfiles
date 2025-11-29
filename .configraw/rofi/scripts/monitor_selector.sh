#!/usr/bin/env bash

function gen_monitors() {
    xrandr | grep -E '\bconnected' | cut -d ' ' -f 1
}

selected_monitor=$( gen_monitors | rofi -dmenu -p "Select main monitor" )
echo -n "${selected_monitor}" > ~/.config/.current_main_monitor

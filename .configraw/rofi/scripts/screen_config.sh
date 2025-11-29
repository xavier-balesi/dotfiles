#!/usr/bin/env bash

SCREENLAYOUT_DIR=~/.screenlayout
function get_screen_configs() {
    find  "${SCREENLAYOUT_DIR}" -type f -exec basename {} \;
}

selection=$( get_screen_configs | rofi -dmenu -p "Select screen layout" )
echo -n "${SCREENLAYOUT_DIR}/${selection}" > ~/.config/.current_screenlayout

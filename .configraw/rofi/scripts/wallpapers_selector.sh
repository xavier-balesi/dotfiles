#!/usr/bin/env bash

WALLPAPERS_DIR=${HOME}/.local/share/wallpapers
#TODO write path from ansible variable (with a template)
WALLPAPER_CACHE=${HOME}/.cache/wallpaper

function gen_wallpapers() {
    for file in $( ls $WALLPAPERS_DIR ); do
        echo "$file"
    done
}

do_exit=0
wallpaper=

while [ ${do_exit} -eq 0 ]; do
    wallpaper=$( gen_wallpapers | rofi -dmenu -p "Select wallpaper" -select "${wallpaper}" )
    if [[ "${wallpaper}" != "" ]]; then
        wallpaper_path="${WALLPAPERS_DIR}/${wallpaper}"
        feh --bg-scale "${wallpaper_path}"
        echo -n "${wallpaper_path}" > "${WALLPAPER_CACHE}"
    else
    do_exit=1
    fi
done


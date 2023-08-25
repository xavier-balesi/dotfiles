#!/bin/bash

# xrandr -s 1920x1080
# xsetroot -cursor_name left_ptr
picom -b


pkill bspc
pkill sxhkd
pkill polybar
pkill dunst

sxhkd &
dunst &

# TODO manage all monitors
MONITOR=${POLYBAR_MONITOR} polybar example &
xscreensaver -nosplash -log /dev/null &

# Set wallpaper
CACHE_WALLPAPER=${HOME}/.cache/wallpaper
DEFAULT_WALLPAPER=${HOME}/.local/share/wallpapers/gruvbox_blame3.jpg
[ ! -f "${CACHE_WALLPAPER}" ] && {
    echo -n "${DEFAULT_WALLPAPER}" > "${CACHE_WALLPAPER}"
}

feh --bg-scale $(cat "${CACHE_WALLPAPER}")

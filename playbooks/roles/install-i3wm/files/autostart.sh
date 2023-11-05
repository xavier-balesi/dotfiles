#!/usr/bin/env bash

# Set wallpaper
CACHE_WALLPAPER=${HOME}/.cache/wallpaper
DEFAULT_WALLPAPER=${HOME}/.local/share/wallpapers/gruvbox_blame3.jpg
[ ! -f "${CACHE_WALLPAPER}" ] && {
    echo -n "${DEFAULT_WALLPAPER}" > "${CACHE_WALLPAPER}"
}

feh --bg-scale $(cat "${CACHE_WALLPAPER}")


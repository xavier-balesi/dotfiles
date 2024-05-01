#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $(realpath $0))
SCRIPTS_DIR=${SCRIPT_DIR}/scripts


# Set screen layout
SCREEN_LAYOUT=${HOME}/.config/.current_screenlayout
[ -f "${SCREEN_LAYOUT}" ] && {
    layout=$(cat "${SCREEN_LAYOUT}")
    bash "${layout}"
}

# Set wallpaper
CACHE_WALLPAPER=${HOME}/.cache/wallpaper
DEFAULT_WALLPAPER=${HOME}/.local/share/wallpapers/gruvbox_blame3.jpg
[ ! -f "${CACHE_WALLPAPER}" ] && {
    echo -n "${DEFAULT_WALLPAPER}" > "${CACHE_WALLPAPER}"
}

feh --bg-scale $(cat "${CACHE_WALLPAPER}")

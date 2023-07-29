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

MONITOR=HDMI-1-0 polybar example &

feh --bg-scale ~/Téléchargements/wp3138019-blame-wallpapers.jpg

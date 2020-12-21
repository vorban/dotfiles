#!/bin/sh
setxkbmap -layout us -variant altgr-intl &
flameshot &
nitrogen --restore &
picom -b
xrandr --output DVI-D-0 --primary --mode 1920x1080 --pos 0x0 --rotate right --output HDMI-0 --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-0 --off --output DP-1 --off &


#!/bin/sh
xrandr --output eDP1 --primary --mode 2160x1440 --pos 2560x0 --rotate normal --output DP1 --off --output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off

killall -s 9 polybar

MONITOR=eDP1 nohup polybar --reload i3mainbar >/dev/null 2>&1 &
MONITOR=HDMI1 nohup polybar --reload i3mainbar >/dev/null 2>&1 &

killall -s 9 fcitx

nohup fcitx >/dev/null 2>&1 &

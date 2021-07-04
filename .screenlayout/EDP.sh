#!/bin/sh
xrandr --output eDP1 --mode 2160x1440 --pos 400x1440 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

killall -s 9 polybar
MONITOR=eDP1 nohup polybar --reload i3mainbar >/dev/null 2>&1 &


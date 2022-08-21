#!/bin/bash

# Check dual monitor setup
# Check if HDMI is plugged in, if so then run dual monitor script.
if xrandr | grep -q "HDMI-0 connected"; then
    # RESOLUTION SETTINGS
    # This sets your HDMI Port Res
    xrandr --output HDMI-0 --mode 3840x2160 --rate 60
    # This sets your laptop monitor to its best resolution.
    xrandr --output eDP-1-0  --mode 1920x1080 --rate 144
    xrandr --output eDP-1-1  --mode 1920x1080 --rate 144

    # MONITOR ORDER
    xrandr --output HDMI-0 --right-of eDP-1-0

    # PRIMARY MONITOR
    # This sets your laptop monitor as your primary monitor.
    xrandr --output eDP-1-0 --primary # cuz im lazy
    xrandr --output eDP-1-1 --primary

    # Increase zoom
    # xrandr --output HDMI-0 --scale 1x1
    # xrandr --output eDP-1-0 --scale 1.2x1.2
fi

# Dual monitor script for small screen.
# if xrandr | grep -q "HDMI-0 connected"; then
#     # RESOLUTION SETTINGS
#     # This sets your HDMI Port Res
#     xrandr --output HDMI-0 --mode 1920x1080 --rate 60
#     # This sets your laptop monitor to its best resolution.
#     xrandr --output eDP-1-0  --mode 1920x1080 --rate 144

#     # MONITOR ORDER
#     xrandr --output HDMI-0 --right-of eDP-1-0
#     xrandr --output HDMI-0 --right-of eDP-1-1

#     # PRIMARY MONITOR
#     # This sets your laptop monitor as your primary monitor.
#     xrandr --output eDP-1-0 --primary

#     # Increase zoom
#     # xrandr --output HDMI-0 --scale 1x1
#     # xrandr --output eDP-1-0 --scale 1.2x1.2
# fi

# Triple montior.
# if xrandr | grep -q "DP-3 connected"; then
#   xrandr --output DP-3 --mode 1920x1080 --rate 60
#   xrandr --output eDP-1-0  --mode 1920x1080 --rate 144

#   xrandr --output DP-3 --right-of HDMI-0
#   # In triple monitor eDP-1-0 becomes eDP-1-1, honestly could be better but idc.
#   # xrandr --output DP-3 --left-of eDP-1-1

#   xrandr --output eDP-1-0 --primary
# fi

# Autorun function, checks if program is already running, if not start
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Autostart "picom -b"
run picom -b
run riseup-vpn
run keepassxc
run conky
# Start activity watch w/o systray
run aw-server
run aw-watcher-afk
run aw-watcher-window

# set background
run feh --bg-scale --randomize /$HOME/wallpapers

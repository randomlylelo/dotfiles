#!/bin/bash

# Check dual monitor setup
# Check if HDMI is plugged in, if so then run dual monitor script.
if xrandr | grep -q "HDMI-0 connected"; then
    # RESOLUTION SETTINGS
    # This sets your HDMI Port Res
    xrandr --output HDMI-0 --mode 3840x2160 --rate 60
    # This sets your laptop monitor to its best resolution.
    xrandr --output eDP-1-0  --mode 1920x1080 --rate 144

    # MONITOR ORDER
    xrandr --output HDMI-0 --right-of eDP-1-0

    # PRIMARY MONITOR
    # This sets your laptop monitor as your primary monitor.
    xrandr --output eDP-1-0 --primary

    # Increase zoom
    # xrandr --output HDMI-0 --scale 1x1
    # xrandr --output eDP-1-0 --scale 1.2x1.2
fi


# Autorun function, checks if program is already running, if not start
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Autostart "picom -b"
run picom -b
# run riseup-vpn
run feh --bg-scale --randomize /$HOME/wallpapers
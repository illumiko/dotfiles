#!/bin/bash
picom -b --config $HOME/dotfiles/wms/picom/picom.conf &
dunst &
xrandr --output eDP --gamma 1:0.9:0.8 --brightness 0.8 &
xrandr --output eDP --auto --output HDMI-A-0 --auto --left-of eDP &
vibrant-cli HDMI-A-0 1.2 &
vibrant-cli eDP 1.1 &
xcape -t 300 -e "Super_L=Super_L|Control_L|b" &
syncthing & 
mpd &
xmodmap $HOME/dotfiles/wms/x11/xmodmap 

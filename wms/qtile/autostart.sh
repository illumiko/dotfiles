#!/bin/bash
picom -b --config $HOME/dotfiles/wms/picom/picom.conf &
dunst &
xrandr --output HDMI-A-0 --gamma 1.3:1.2:1.12 --brightness 0.95 &
xrandr --output eDP --gamma 1:0.9:0.8 --brightness 0.8 &
# xrandr --output eDP --auto --output HDMI-A-0 --auto --above eDP &
vibrant-cli HDMI-A-0 0.9 &
vibrant-cli eDP 1.1 &
syncthing & 
mpd &
xmodmap $HOME/dotfiles/wms/x11/xmodmap 

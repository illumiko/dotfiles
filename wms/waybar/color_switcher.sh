#!/bin/bash
if [ "$1" = 'light' ]; then
    cat $HOME/dotfiles/wms/waybar/color_light.css > $HOME/dotfiles/wms/waybar/colors.css
elif [ "$1" = 'dark' ]; then
    cat $HOME/dotfiles/wms/waybar/color_dark.css > $HOME/dotfiles/wms/waybar/colors.css
else
    echo "Error: Invalid argument. Use 'light' or 'dark'."
    exit 1
fi

# Restart Waybar
if pgrep waybar > /dev/null; then
    killall waybar
fi
waybar &
echo "Waybar restarted."

#!/bin/bash

# Get active workspace details from Hyprland
orientation=$(hyprctl activeworkspace | grep 'orientation' | awk '{print $2}')

if [[ "$orientation" == "0" ]]; then
    echo "Horizontal"
elif [[ "$orientation" == "1" ]]; then
    echo "Vertical"
else
    echo "Unknown"
fi

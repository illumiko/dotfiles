#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"  & # for GTK3 apps
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &  # for GTK4 apps
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct &
rofi -show run




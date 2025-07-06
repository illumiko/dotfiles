#https://github.com/ErikReider/SwayAudioIdleInhibit
# needed
swayidle -w timeout 300 'hyprlock' \
    timeout 600 'systemctl sleep' &

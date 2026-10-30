for name in "$@"; do
    if [[ "$name" == dark ]]; then
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        $HOME/dotfiles/wms/waybar/color_switcher.sh dark
        cat $HOME/dotfiles/kitty/colors/rose-pine-moon > $HOME/dotfiles/kitty/main-theme.conf
        brightnessctl s 50%


    elif [[ "$name" == light ]]; then
        brightnessctl s 20%
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        # $HOME/dotfiles/wms/waybar/color_switcher.sh light
        $HOME/dotfiles/wms/waybar/color_switcher.sh dark
        cat $HOME/dotfiles/kitty/colors/rose-pine-dawn > $HOME/dotfiles/kitty/main-theme.conf
    fi
done

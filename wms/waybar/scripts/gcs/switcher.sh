for name in "$@"; do
    if [[ "$name" == dark ]]; then
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        $HOME/dotfiles/wms/waybar/color_switcher.sh dark
        cat $HOME/dotfiles/kitty/colors/gruvbox.conf > $HOME/dotfiles/kitty/main-theme.conf
        brightnessctl s 50%
        cat $HOME/dotfiles/nvim/lua/user/color_dark.lua > $HOME/dotfiles/nvim/lua/user/color.lua
        pkill -SIGUSR1 foot #dark

    elif [[ "$name" == light ]]; then
        brightnessctl s 20%
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        # $HOME/dotfiles/wms/waybar/color_switcher.sh light
        $HOME/dotfiles/wms/waybar/color_switcher.sh dark
        cat $HOME/dotfiles/kitty/colors/gruvbox_light.conf > $HOME/dotfiles/kitty/main-theme.conf
        cat $HOME/dotfiles/nvim/lua/user/color_light.lua > $HOME/dotfiles/nvim/lua/user/color.lua
        pkill -SIGUSR2 foot #dark
    fi
done

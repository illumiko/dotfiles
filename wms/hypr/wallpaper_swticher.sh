# while true; do
#     WALPAPER_DIR="$HOME/dotfiles/wallpaper/Wallpaper/not_anime"
#     CURRENT_WALL=$(hyprctl hyprpaper listloaded)
#     WALLPAPER=$(find "$WALLPAPER_DIR" - type f ! -name "$(basename "$CURRENT_WALL")"| shuf -n 1)
#     hyprctl hyprpaper reload ,"$WALLPAPER"
#     sleep 5
# done
 while true; do
    WALLPAPER_DIR="$HOME/dotfiles/wallpaper/Wallpaper/not_anime"
    CURRENT_WALL=$(hyprctl hyprpaper listloaded)

    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

    # Apply the selected wallpaper
    hyprctl hyprpaper reload ,"$WALLPAPER"
    sleep 30m
 done

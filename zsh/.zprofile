#set important key
setxkbmap -option caps:escape

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set wallpaper
feh --randomize --bg-fill ~/Pictures/wallpapers/*

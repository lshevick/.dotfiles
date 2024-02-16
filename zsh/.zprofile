#!/bin/sh
#set important key
setxkbmap -option caps:escape

export XDG_CONFIG_HOME=$HOME/.config
VIM="vim"

export STOW_FOLDERS="zsh"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

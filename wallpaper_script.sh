#!/bin/sh


dir="$HOME/.config/rofi/launchers/type-7"
theme='style-7'
wallpaper=$(ls ~/.wall | rofi -dmenu -i -l 5 -theme ${dir}/${theme}.rasi)

[ $wallpaper -z ] || feh --bg-fill /home/kali/.wall/$wallpaper  
cp $HOME/.wall/$wallpaper $HOME/.config/rofi/images/g.png 
betterlockscreen -u /home/kali/.wall/$wallpaper --fx dim 

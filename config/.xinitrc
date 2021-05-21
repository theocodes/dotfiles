#!/bin/sh

# currently at 120hz due to alacritty not being
# able to handle 165hz for some reason...
/home/theocodes/.dotfiles/bin/fixmonitors &

nitrogen --restore &
picom &
##nm-applet &
/home/theocodes/.dotfiles/bin/statusbar &

while true; do
    # Log stderror to a file 
    /home/theocodes/repos/github.com/theocodes/dwm/dwm 2> ~/.dwm.log
    # dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

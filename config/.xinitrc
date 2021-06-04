#!/bin/sh

if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
	dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# currently at 120hz due to alacritty not being
# able to handle 165hz for some reason...
/home/theocodes/.dotfiles/bin/fixmonitors &

nitrogen --restore &
picom &
flameshot &
nm-applet &
# /home/theocodes/dotfiles/bin/statusbar &

# while true; do
#     # Log stderror to a file
#     /home/theocodes/repos/github.com/theocodes/dwm/dwm 2> ~/.dwm.log
#     # dwm 2> ~/.dwm.log
#     # No error logging
#     #dwm >/dev/null 2>&1
# done

exec emacs

#!/bin/sh
# Startup first before login

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources"]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap"]; then
    xmodmap "$usermodmap"
fi

systemctl --user import-environment DISPLAY

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec bspwm

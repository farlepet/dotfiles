# exec alopex "~/.config/alopex/statusbar.sh"
/usr/bin/xscreensaver -no-splash &

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# exec awesome
# exec alopex
# exec subtle

/usr/bin/start-pulseaudio-x11 &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


#sxhkd &


#exec bspwm


#feh --bg-scale --no-xinerama /home/farlepet/Documents/wallpaper.jpg &


urxvtd -q -f -o
xbindkeys &
#synclient touchpadOff=1 &
wmname LG3D &


# Notification daemon
#dunst &
/usr/lib/notification-daemon-1.0/notification-daemon &

/bin/mpd &
compton --backend glx --vsync opengl-swc -cC --no-fading-openclose -b &

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#exec ~/.config/bspwm/wm

nitrogen --restore &

#exec awesome
#exec alopex #~/.config/alopex/statusbar.sh
exec i3 -V > ~/.i3log

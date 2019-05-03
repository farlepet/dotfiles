# Screensaver/lock
/usr/bin/xscreensaver -no-splash &

# SSH key manager
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Terminal server
urxvtd -q -f -o

# Keybindings
#xbindkeys &

# Java fix
wmname LG3D &


# Prevent screensaver while Kodi is open:
/bin/kodi-prevent-xscreensaver &

# Notification daemon
dunst &
#/usr/lib/notification-daemon-1.0/notification-daemon &

# Compositor
xcompmgr &
#compton --backend glx --vsync opengl-swc -cC --no-fading-openclose -b &

# Wallpaper
nitrogen --restore &

# Disable screensaver while in fullscreen
caffeine &

# Window Manager
exec i3 -V > ~/.i3log

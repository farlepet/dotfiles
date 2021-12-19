# SSH key manager
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Terminal server
urxvtd -q -f -o

# Screen Layout
/home/farlepet/.screenlayout/5700xt.sh

# Java fix
wmname LG3D &

# Screensaver/lock
xautolock -time 1 -locker /home/farlepet/bin/display_lockscreen -corners 000- &

# Notification daemon
dunst &

# Polkit Agent:
lxqt-policykit-agent &

# Compositor
xcompmgr &

# Wallpaper
nitrogen --restore &

# Disable screensaver while in fullscreen
caffeine &

# Input method switcher
fcitx &

# Window Manager
exec i3 -V > ~/.i3log


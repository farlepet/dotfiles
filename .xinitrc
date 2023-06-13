# SSH key manager
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Terminal server
urxvtd -q -f -o

# Screen Layout
#/home/farlepet/.screenlayout/5700xt-dual.sh
/home/farlepet/.screenlayout/tri-head-home.sh

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


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ]   && source ~/.xprofile

# Window Manager
exec i3 -V > ~/.i3log


#!/bin/sh

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
GTK_THEME=Adapta waybar &

echo "Bars launched..."


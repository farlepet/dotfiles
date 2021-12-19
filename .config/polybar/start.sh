#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar topBar1 &
polybar topBar2 &
polybar topBar3 &
polybar topBar4 &
polybar bottomBar &
polybar bottomBar2 &


echo "Bars launched..."


#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c ~/.config/polybar/themes/winardiaris/config.ini winardiaris &
# polybar -c ~/.config/polybar/themes/nordic/config.ini nordic &

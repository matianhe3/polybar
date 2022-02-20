#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
echo hook:module/ipc1 >>/tmp/polybar_mqueue.*
polybar-msg [-p pid] hook ipc 1

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

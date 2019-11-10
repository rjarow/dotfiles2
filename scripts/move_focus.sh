#!/bin/bash

# Script that moves focus to the next window sideways.
# Usage:
#    move_focus.bash left|right


# Check paramters.
direction=$1
if [ "$direction" != "left" ] && [ "$direction" != "right" ] ; then
    echo "Usage: $0 left|right"
    exit 1
fi

# Gather current state.
all_windows=$(xprop -root | grep '_NET_CLIENT_LIST_STACKING(WINDOW)' | cut -d "#" -f2 | tr ',' '\n' | sed 's, ,,g')
current_window=$(xdotool getactivewindow)  # xdotool retuns decimal ID while xprop used hexadecimal.
current_window=0x$(echo "obase=16; $current_window" | bc | tr '[:upper:]' '[:lower:]')
current_position=$(xdotool getwindowgeometry $current_window | grep "Position" | cut -d ':' -f2 | cut -d ',' -f1)
current_desktop=$(xprop -id $current_window | grep _NET_WM_DESKTOP | cut -d '=' -f2)

# These keep track of the best window found so far.
shortest_distance=9999999  # Some number larger than the screen width.
best_window=None

# Check each window, remembering the best so far.
for window in $all_windows ; do
    # Disregard the current window.
    if [ $window == $current_window ] ; then
        continue
    fi

    # Disregard windows on the wrong desktop.
    desktop=$(xprop -id $window | grep _NET_WM_DESKTOP | cut -d '=' -f2)
    if [ $desktop != $current_desktop ] ; then
        continue
    fi

    position=$(xdotool getwindowgeometry $window | grep "Position" | cut -d ':' -f2 | cut -d ',' -f1)

    # Disregard windows on the wrong side of the current window.
    if [ "$direction" == "left" ] && [ $position -gt $current_position ] ; then
        continue
    fi
    if [ "$direction" == "right" ] && [ $position -lt $current_position ] ; then
        continue
    fi

    # Compute absolute valued distance to candiate window.
    distance=$(($current_position - $position))
    distance=${distance#-}
    if [ $distance -lt $shortest_distance ] ; then
        best_window=$window
        shortest_distance=$distance
    fi
done

if [ "$best_window" != "None" ] ; then
    xdotool windowactivate $best_window
fi

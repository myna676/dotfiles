#!/bin/bash

# Toggle between two sets of active/inactive opacity values
STATE_FILE="/tmp/hypr_opacity_mode"

if [ ! -f "$STATE_FILE" ]; then
    echo "normal" > "$STATE_FILE"
fi

CURRENT_MODE=$(cat "$STATE_FILE")

if [ "$CURRENT_MODE" = "normal" ]; then
    # Toggle to transparent mode
    hyprctl reload
    echo "transparent" > "$STATE_FILE"
else
    # Toggle to opaque mode
    hyprctl clients -j | jq -r '.[].address' | while read -r addr; do
	  echo "address:${addr}!" 
	  hyprctl dispatch setprop "address:${addr}" alpha 1.0
    done
    echo "normal" > "$STATE_FILE"
fi

#!/usr/bin/env bash
direction=$1 # "left", "right", "up", "down"
border=${2:-0}

window=$(niri msg --json windows | jq '.[] | select(.is_focused and .is_floating)')
if [ -z "$window" ]; then
    echo "No focused floating window found."
    exit 1
fi

id=$(echo "$window" | jq '.id')
width=$(echo "$window" | jq '.layout.window_size[0]')
height=$(echo "$window" | jq '.layout.window_size[1]')
x=$(echo "$window" | jq '.layout.tile_pos_in_workspace_view[0]')
y=$(echo "$window" | jq '.layout.tile_pos_in_workspace_view[1]')

output=$(niri msg --json workspaces | jq '.[] | select(.is_focused) | .output' | tr -d '"')

screen_width=$(niri msg --json outputs | jq ".[ \"$output\" ].logical.width")
screen_height=$(niri msg --json outputs | jq ".[ \"$output\" ].logical.height")

case $direction in
    "left")
        new_x=$border
        new_y=$y
        ;;
    "right")
        new_x=$((screen_width - width - border))
        new_y=$y
        ;;
    "up")
        new_x=$x
        new_y=$border
        ;;
    "down")
        new_x=$x
        new_y=$((screen_height - height - border))
        ;;
    *)
        echo "Usage: $0 [left|right|up|down] [border]"
        exit 1
        ;;
esac

niri msg action move-floating-window --id "$id" -x "$new_x" -y "$new_y"

#!/usr/bin/env bash

set -euo pipefail

# Save the currently focused window.
focused_id=$(niri msg --json focused-window | jq -r '.id // empty')

# Find Discord's window.
discord_id=$(
    niri msg --json windows |
    jq -r '.[] |
        select((.app_id // "" | ascii_downcase) | contains("discord")) |
        .id' |
    head -n1
)

# Discord must be running.
if [[ -z "$discord_id" ]]; then
    exit 1
fi

# Focus Discord and send its mute shortcut.
niri msg action focus-window --id "$discord_id"
sleep 0.2
wtype -M ctrl -M shift -P m -p m -m shift -m ctrl
sleep 0.2

# Restore the previous window, if necessary.
if [[ -n "$focused_id" && "$focused_id" != "$discord_id" ]]; then
    niri msg action focus-window --id "$focused_id"
fi

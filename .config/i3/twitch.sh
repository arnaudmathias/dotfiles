#!/bin/bash

function get_empty_workspace_number() {
  echo $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
}

WORKSPACE_NUMBER=$(get_empty_workspace_number)
echo "$WORKSPACE_NUMBER"
i3-msg "workspace number $WORKSPACE_NUMBER $1; exec streamlink https://www.twitch.tv/$1 --default-stream best --twitch-low-latency; exec chatterino -c $1"

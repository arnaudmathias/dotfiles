#!/bin/bash
monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
if [ -n "$monitor" ]; then
  hyprctl keyword monitor "$monitor",0x0,1,90
fi

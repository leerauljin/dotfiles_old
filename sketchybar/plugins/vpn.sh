#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

if [[ $VPN != "" ]]; then
  sketchybar --set $NAME icon=􀞚 label="$VPN" update_freq=200
else
  sketchybar --set $NAME icon=􀞞 label="No VPN" update_freq=15
fi

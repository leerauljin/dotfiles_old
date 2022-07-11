#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [ "$SSID" = "" ]; then
#   sketchybar --set $NAME label="Disconnected" icon=睊
  sketchybar --set $NAME icon=睊 \
                         icon.color=0xfff7768e
else
#   sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=直
  sketchybar --set $NAME icon=直 \
                         icon.color=0xff7aa2f7
fi
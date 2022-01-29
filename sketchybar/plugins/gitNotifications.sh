#!/usr/bin/env bash

NOTIFICATIONS="$(gh api notifications | jq '.[]')"
STARS="$(gh api repos/FelixKratz/SketchyBar | jq '.stargazers_count')"

if [ "$NOTIFICATIONS" = "" ]; then
  sketchybar --set $NAME icon=􀠧 label="$STARS"
else
  sketchybar --set $NAME icon=􀠨 label="$STARS"
fi


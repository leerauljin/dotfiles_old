#!/usr/bin/env sh

update() {
  # This is called for all other events
  WINDOW=$(yabai -m query --windows --window)
  case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        sketchybar --set $NAME icon="􀤳"
      ;;
      "true")
      sketchybar --set $NAME icon="􀶣"
      ;;
  esac
}

mouse_clicked() {
  yabai -m window --toggle float
  update
}

mouse_entered() {
  sketchybar --set $NAME background.drawing=on 
}

mouse_exited() {
  sketchybar --set $NAME background.drawing=off 
}

case "$SENDER" in
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  *) update 
  ;;
esac

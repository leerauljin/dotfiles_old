#!/usr/bin/env sh

sketchybar --add       item               calendar.time right                           \
           --set       calendar.time      update_freq=2                                 \
                                          label.font="$FONT:Black:14"      \
                                          label.color=$BAR_COLOR                       \
                                          icon.drawing=off                              \
                                          script="$PLUGIN_DIR/time.sh"                  \
                                                                                        \
           --clone     calendar.date      label_template                                \
           --set       calendar.date      update_freq=60                                \
                                          label.font="$FONT:Bold:14"      \
                                          position=right                                \
                                          label=cal                                     \
                                          drawing=on                                    \
                                          background.padding_left=0                                       \
                                          script="$PLUGIN_DIR/date.sh"                  \
                                                                                        \
           --add       bracket            calendar                                      \
                                          calendar.time                                 \
                                          calendar.date                                 \
                                                                                        \
           --set       calendar           background.drawing=on

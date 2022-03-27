#!/usr/bin/env sh

sketchybar --clone     system.label       label_template                                \
           --set       system.label       label=sys                                     \
                                          label.align=left                 \
                                          label.background.shadow.drawing=off               \
                                          label.background.shadow.angle=45                  \
                                          background.drawing=off              \
                                          background.padding_left=6         \
                                          label.background.drawing=off                                      \
                                          label.font="$FONT:Black:16"      \
                                          position=left                                 \
                                          drawing=on                                    \
                                          script="$PLUGIN_DIR/window_title.sh"          \
           --subscribe system.label       front_app_switched                            \

                                                                                        \
           --add       bracket            system                                        \
                                          system.label                                  \
                                                                                        \
           --set       system             background.drawing=off              \
                                          background.padding_left=0         \

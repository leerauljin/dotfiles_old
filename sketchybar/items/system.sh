#!/usr/bin/env sh

sketchybar --clone     system.label       label_template                                \
           --set       system.label       label=sys                                     \
                                          label.align=center                 \
                                          label.background.shadow.drawing=on                                            \
                                          label.background.shadow.angle=45                                            \
                                          label.background.shadow.distance=6                                            \
                                          label.background.shadow.color=0x88000000                                            \
                                          position=center                                 \
                                          drawing=on                                    \
                                          script="$PLUGIN_DIR/window_title.sh"          \
           --subscribe system.label       front_app_switched                            \

                                                                                        \
           --add       bracket            system                                        \
                                          system.label                                  \
                                                                                        \
           --set       system             background.drawing=on              \
                                          background.padding_right=0         \

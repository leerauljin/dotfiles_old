#!/usr/bin/env sh

sketchybar --clone     system.label       label_template                                \
           --set       system.label       label=sys                                     \
                                          position=center                                 \
                                          drawing=on                                    \
                                          script="$PLUGIN_DIR/window_title.sh"          \
           --subscribe system.label       front_app_switched                            \

                                                                                        \
           --add       bracket            system                                        \
                                          system.label                                  \
                                                                                        \
           --set       system             background.drawing=on

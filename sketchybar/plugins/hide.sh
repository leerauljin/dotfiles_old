#!/usr/bin/env bash

DESKTOP=$(defaults read com.apple.finder CreateDesktop)

if [[ $DESKTOP == "true" ]]; then 
    sketchybar -m --set $NAME label="❚" label.color=0x33ffffff
    defaults write com.apple.finder CreateDesktop false
    killall Finder
else 
    sketchybar -m --set $NAME label="❚" label.color=0xffffffff
    defaults write com.apple.finder CreateDesktop true
    killall Finder
fi

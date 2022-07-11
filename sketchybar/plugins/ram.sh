#!/usr/bin/env sh

sketchybar -m --set ram_percentage label=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5"%"}')

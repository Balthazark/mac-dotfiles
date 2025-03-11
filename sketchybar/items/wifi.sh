#!/bin/bash

sketchybar --add item wifi right \
           --set wifi update_freq=60 \
                         script="$PLUGIN_DIR/wifi.sh" icon.color=$BAR_COLOR background.color=$COLOR_BLUE  label.padding_left=0 \
           --subscribe wifi system_woke network_change
#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" icon.color=$BAR_COLOR background.color=$COLOR_LAVENDER label.padding_left=0  icon.padding_left=8 icon.padding_right=2\
           --subscribe volume volume_change \
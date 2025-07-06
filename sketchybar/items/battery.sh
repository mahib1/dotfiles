#!/bin/zsh



sketchybar --add item battery right \
           --set battery script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

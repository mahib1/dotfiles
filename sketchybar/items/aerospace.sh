#!/bin/zsh

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_focus_change

sketchybar --add item aerospace left \
           --subscribe aerospace aerospace_workspace_change \
                             aerospace_focus_change \
           --set aerospace label="􀏧" \
                          script="$PLUGIN_DIR/aerospace_plugin" \
                          click_script="aerospace reload-config"

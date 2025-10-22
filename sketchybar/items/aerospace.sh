#!/usr/bin/env bash
# ~/.config/sketchybar/items/spaces.sh

# 1) make sure the custom event exists
sketchybar --add event aerospace_workspace_change

# 2) build one item per workspace and subscribe it to the event
#    (use the full path to aerospace if needed, e.g. /opt/homebrew/bin/aerospace)
AERO="${AERO_PATH:-aerospace}"

# style: start with background hidden (only the focused one will toggle on)
SPACE_BG="0x44ffffff"
SPACE_RADIUS=6
SPACE_HEIGHT=22

for sid in $($AERO list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --set space.$sid \
      icon.drawing=off \
      label="$sid" \
      background.color=$SPACE_BG \
      background.corner_radius=$SPACE_RADIUS \
      background.height=$SPACE_HEIGHT \
      background.drawing=off \
      script="$PLUGIN_DIR/aerospace.sh $sid" \
      click_script="$AERO workspace $sid" \
    --subscribe space.$sid aerospace_workspace_change
done

# 3) one initial trigger so highlight is correct on load
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE="$($AERO list-workspaces --focused)"


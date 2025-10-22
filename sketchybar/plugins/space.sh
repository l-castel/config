#!/usr/bin/env bash
# ~/.config/sketchybar/items/spaces.sh

# Add a custom event once (safe to call on reload)
sketchybar --add event aerospace_workspace_change

# You can tweak these if you like (or keep your global defaults)
SPACE_BG="0x44ffffff"  # semi-transparent white
SPACE_RADIUS=5
SPACE_HEIGHT=20

# Create one item per AeroSpace workspace (visible across all monitors)
# Use --all to list every defined workspace id
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
      icon.drawing=off \
      label="$sid" \
      background.color=$SPACE_BG \
      background.corner_radius=$SPACE_RADIUS \
      background.height=$SPACE_HEIGHT \
      background.drawing=off \
      click_script="aerospace workspace $sid" \
      script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Trigger once so the current workspace is highlighted on load
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"


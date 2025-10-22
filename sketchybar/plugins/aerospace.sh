#!/usr/bin/env bash
# Called as: aerospace.sh <workspace_id>
WS="$1"

# If the event didn't pass FOCUSED_WORKSPACE, query AeroSpace
if [ -z "$FOCUSED_WORKSPACE" ]; then
  AERO="${AERO_PATH:-/opt/homebrew/bin/aerospace}"
  FOCUSED_WORKSPACE="$("$AERO" list-workspaces --focused 2>/dev/null)"
fi

if [ "$WS" = "$FOCUSED_WORKSPACE" ]; then
  # Focused: turn ON label background
  sketchybar --set "$NAME" \
    label.background.drawing=on \
    label.color=0xffffffff
else
  # Others: turn it OFF
  sketchybar --set "$NAME" \
    label.background.drawing=off \
    label.color=0xccffffff
fi


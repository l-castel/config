#!/usr/bin/env bash
# Show real AeroSpace workspaces; highlight focused by toggling label background.
# IMPORTANT: all hyphens are plain ASCII '-'.

sketchybar --add event aerospace_workspace_change

AERO="${AERO_PATH:-/opt/homebrew/bin/aerospace}"
PLUGIN="$HOME/.config/sketchybar/plugins/aerospace.sh"

# Optional cleanup (requires jq). Comment out if you don't have jq.
if command -v jq >/dev/null 2>&1; then
  for old in $(sketchybar --query | jq -r '.items[].name' | grep '^space\.'); do
    sketchybar --remove "$old"
  done
fi

# Get actual workspaces (IDs or names)
workspaces="$("$AERO" list-workspaces --all 2>/dev/null)"
[ -z "$workspaces" ] && workspaces="1 2 3 4 5"

sanitize() { echo "$1" | tr -cs '[:alnum:]' '_'; }

for ws in $workspaces; do
  item="space.$(sanitize "$ws")"

  sketchybar --add item "$item" left \
    --set "$item" \
      icon="$ws" \
      icon.padding_left=10 \
      icon.padding_right=15 \
      padding_left=2 \
      padding_right=2 \
      label.padding_right=20 \
      icon.highlight_color=$RED \
      label.font="sketchybar-app-font:Regular:16.0" \
      label.background.height=26 \
      label.background.drawing=off \
      label.background.color=$BACKGROUND_2 \
      label.background.corner_radius=8 \
      label.drawing=off \
      script="$PLUGIN $ws" \
      click_script="$AERO workspace \"$ws\"" \
    --subscribe "$item" aerospace_workspace_change
done

# Group styling
sketchybar --add bracket spaces '/space\..*/' \
  --set spaces \
    background.color=$BACKGROUND_1 \
    background.border_color=$BACKGROUND_2 \
    background.border_width=2 \
    background.drawing=on

# Separator (optional)
sketchybar --add item separator left \
  --set separator \
    icon=􀆊 \
    icon.font="$FONT:Heavy:16.0" \
    padding_left=15 \
    padding_right=15 \
    label.drawing=off \
    associated_display=active \
    click_script="$AERO workspace next" \
    icon.color=$WHITE

# Seed initial highlight (ASCII hyphens!)
focused="$("$AERO" list-workspaces --focused 2>/dev/null)"
[ -z "$focused" ] && focused="1"
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE="$focused"


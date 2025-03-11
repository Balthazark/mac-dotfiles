#!/bin/sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  9[0-9]|100) ICON="􀛨"
  ;;
  [6-8][0-9]) ICON="􀺸"
  ;;
  [3-5][0-9]) ICON="􀺶"
  ;;
  [1-2][0-9]) ICON="􀛩"
  ;;
  *) ICON="􀛪"
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
fi

# Determine the icon color based on the battery percentage
if [ "$PERCENTAGE" -ge 80 ]; then
  ICON_COLOR="0xffa6e3a1"  # Green (e.g., Catppuccin Mocha green)
elif [ "$PERCENTAGE" -ge 40 ]; then
  ICON_COLOR="0xfff9e2af"  # Yellow (e.g., Catppuccin Mocha yellow)
else
  ICON_COLOR="0xfff38ba8"  # Red (e.g., Catppuccin Mocha red)
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color="$ICON_COLOR"
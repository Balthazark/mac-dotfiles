#!/bin/sh

# Get the current Wi-Fi SSID using ipconfig and networksetup
SSID=$(ipconfig getsummary $(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}') | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ -z "$SSID" ]; then
  ICON="􀙈" 
  LABEL="No WiFi"
else
  ICON="􀙇"  
  LABEL="$SSID"
fi

sketchybar --set $NAME icon="$ICON" 

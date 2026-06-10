#!/bin/bash
modes="5 minutes\n10 minutes\n20 minutes\n30 minutes\ninfinity"
choice=$(echo -e "$modes" | fuzzel --dmenu --lines 5 -w 20 --config /home/drjnk/niri-setup/fuzzel/idle-time.ini)
if [ ! -z "$choice" ]; then
  pkill swayidle
  echo $choice >$HOME/.local/state/idle-time
  bash /home/drjnk/niri-setup/scripts/swayidle.sh &
  disown
fi

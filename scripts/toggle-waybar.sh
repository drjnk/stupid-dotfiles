#!/bin/bash
if [ -z $(pidof waybar) ]; then
  waybar -c /home/drjnk/niri-setup/waybar/config -s /home/drjnk/niri-setup/waybar/style.css &
else
  pkill waybar
fi

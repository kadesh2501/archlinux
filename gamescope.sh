#!/bin/sh
#install gamescope
sudo pacman -Sy gamescope p7zip ark
#set gamescope priority -- https://wiki.archlinux.org/title/Gamescope#Setting_Gamescopes_priority
sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
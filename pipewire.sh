#!/bin/sh
#pipewire for audio
sudo pacman -Sy pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber pavucontrol alsa-utils
#enable it
systemctl enable --user pipewire-pulse.service
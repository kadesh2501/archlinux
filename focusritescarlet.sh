#!/bin/sh
#setup drivers for focusrite scarlett
sudo pacman -Sy alsa-scarlett-gui
sudo tee /etc/modprobe.d/scarlett.conf <<EOF
options snd_usb_audio vid=0x1235 pid=0x8212 device_setup=1
EOF
#regen initram for scarlet module
sudo mkinitcpio -P
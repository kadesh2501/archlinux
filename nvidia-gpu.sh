#!/bin/sh
#TODO add nvidia-drm.modeset=1 kernel parameter to grub2s
#on RTX 3070M gamescope is probably not an option thanks NVIDIA
#you may have issues when switching workspaces for fullscreen games
#install NVIDIA GPU drivers
sudo pacman -S --noconfirm --needed nvtop nvidia lib32-nvidia-utils nvidia-utils
#update initram
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -P
#add a hook for pacman so kernel is always updated on driver updates
sudo mkdir /etc/pacman.d/hooks
sudo cp nvidia.hook /etc/pacman.d/hooks/nvidia.hook
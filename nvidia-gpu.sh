#!/bin/sh
#install NVIDIA GPU drivers
sudo pacman -Sy nvtop nvidia lib32-nvidia-utils nvidia-utils
#update initram
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -P
#add a hook for pacman so kernel is always updated on driver updates
sudo cp nvidia.hook /etc/pacman.d/hooks/nvidia.hook
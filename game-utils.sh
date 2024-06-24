#!/bin/sh
#setup bkVasalt mangohud etc 
sudo pacman -S --noconfirm mesa-demos vulkan-tools lazarus qt5pas breeze
yay -S goverlay vkbasalt replay-sorcery-git mangohud lib32-mangohud
#copy over reshade shaders
sudo cp -R  ~/archlinux/opt/reshade /opt
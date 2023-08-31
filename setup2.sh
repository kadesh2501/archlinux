#!/bin/sh

#install paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si

#check for updates
paru -Syu
sudo pacman -Syu

#base hyprland
paru -S hyprland-bin hyprpaper waybar-hyprland-git xdg-desktop-portal-wlr
wlroots xdg-desktop-portal polkit-kde-agent 
rofi-lbonn-wayland-git wezterm kitty pcmanfm-qt neovim gedit 
paru -S brightnessctl pavucontrol alsa-utils grim slurp mpv vvave librewolf-bin wlogout nm-applet 

#theme
paru -S catppuccin-gtk-theme-mocha vimix-cursors  tela-icon-theme 
cd Downloads &
git clone https://github.com/vs66388/hyprland.git
cp .config/ ~/.config/
#wallpaper to be at ~/.config/hypr/hyprpaper.conf
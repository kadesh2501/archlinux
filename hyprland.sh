#!/bin/sh
#re-write this it's kinda meh
#could perhaps just pull hyde as it's better anyways
#install hyprland itself
yay -S hyprland-git hyprpaper-git waybar-hyprland-git xdg-desktop-portal-wlr wlroots xdg-desktop-portal \
polkit-kde-agent rofi-lbonn-wayland-git wezterm pcmanfm-qt brightnessctl \
grim slurp wlogout-git udiskie thunar dunst xorg-xwayland thunar-archive-plugin thunar-media-tags-plugin swayidle swaylock sway-audio-idle-inhibit-git
#set some defaults - this should probably be moved into xdg config files so KDE and hyprland can coexist
xdg-settings set default-web-browser firefox.desktop #make firefox default web handler
xdg-mime default thunar.desktop inode/directory #make thunar default file handler
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http #make firefox default URL handler
#make support scripts executable
chmod +x ~/.config/hypr/scripts/swayidle.sh
#theme
sudo pacman -S --needed ttf-font-awesome ttc-iosevka noto-fonts-cjk playerctl
yay -S --noconfirm --needed catppuccin-gtk-theme-mocha vimix-cursors tela-icon-theme otf-font-awesome ttf-jetbrains-mono-nerd

mkdir ~/Pictures
mkdir ~/Pictures/wallpaper
cp ~/archlinux/wallpaper.jpg ~/Pictures/wallpaper/wallpaper.jpg

#copy .hyperlandenv for Environment variables
cp ~/archlinux/.hyperlandenv ~/.hyperlandenv
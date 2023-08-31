#!/bin/sh
#install base stuffs
sudo pacman -S --noconfirm --needed tldr man nano mc rsync amd-ucode timeshift openssh
#install paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si

#check for updates
paru -Syu
sudo pacman -Syu

#base hyprland
paru -S --noconfirm --needed hyprland-git hyprpaper waybar-hyprland-git xdg-desktop-portal-wlr wlroots xdg-desktop-portal polkit-kde-agent rofi-lbonn-wayland-git wezterm kitty pcmanfm-qt neovim gedit brightnessctl pavucontrol alsa-utils grim slurp mpv vvave librewolf-bin wlogout network-manager-applet  udiskie

#theme
paru -S --noconfirm --needed catppuccin-gtk-theme-mocha vimix-cursors  tela-icon-theme 
mkdir ~/Downloads
cd ~/Downloads
git clone https://github.com/vs66388/hyprland.git
cp -r ~/Downloads/hyprland/.config/ ~/.config/
#wallpaper to be at ~/.config/hypr/hyprpaper.conf

#ssh
cp sshd_config.conf /etc/ssh/sshd_config.conf
sudo systemctl enable sshd
sudo systemctl start sshd

#copy modified configs
#cp keybinds.conf ~/.config/hypr/keybinds.conf
#cp startup.conf ~/.config/hypr/startup.conf
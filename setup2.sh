#!/bin/sh
#install base stuffs
sudo pacman -S --noconfirm --needed tldr man nano mc rsync amd-ucode timeshift openssh
#ssh
sudo cp sshd_config.conf /etc/ssh/sshd_config.conf
sudo systemctl enable sshd
sudo systemctl start sshd
#install paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si

#check for updates
paru -Syu
sudo pacman -Syu

#base hyprland
paru -S --needed hyprland-git hyprpaper waybar-hyprland-git xdg-desktop-portal-wlr wlroots xdg-desktop-portal \
polkit-kde-agent rofi-lbonn-wayland-git wezterm kitty pcmanfm-qt neovim gedit brightnessctl pavucontrol alsa-utils \
grim slurp librewolf-bin wlogout network-manager-applet udiskie pipewire-media-session thunar

#theme
paru -S --noconfirm --needed catppuccin-gtk-theme-mocha vimix-cursors tela-icon-theme 
cp -r ~/hyprland/.config/ ~/.config/
mkdir ~/Pictures/wallpaper
cp ~/hyprland/wallpaper.jpg ~/Pictures/wallpaper/wallpaper.jpg

#setup flatpaks
#sudo pacman -Sy flatpak
#steam
#flatpak install flathub com.valvesoftware.Steam
#flatseal
#flatpak install flathub com.github.tchx84.Flatseal
#I um and ah'd over this but flatpak is probs better
#flatpak install flathub org.videolan.VLC
#install xivlauncher
#paru -S xivlauncher-git

#some other apps
#flatpak install flathub com.discordapp.Discord
#flatpak install flathub com.visualstudio.code
#flatpak install flathub net.davidotek.pupgui2
#flatpak install flathub com.heroicgameslauncher.hgl
#flatpak install flathub org.gimp.GIMP
#flatpak install flathub org.gnome.baobab
#flatpak install flathub org.audacityteam.Audacity
#flatpak install flathub org.blender.Blender
#flatpak install flathub fr.handbrake.ghb
#flatpak install flathub io.gitlab.librewolf-community
#emulators
#flatpak install flathub org.yuzu_emu.yuzu
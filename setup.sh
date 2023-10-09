#!/bin/sh
#this should be run as standard user
cp ~
#install git and base-devel incase they weren't installed by archinstall
sudo pacman -S --noconfirm --needed git base-devel
#install paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si
cp ~
#check for updates
paru -Syu
sudo pacman -Syu

#install base stuffs
sudo pacman -S --noconfirm --needed tldr man nano mc rsync amd-ucode timeshift openssh btop neofetch bat dnsutils htop

#ssh
sudo cp ~/hyprland/sshd_config.conf /etc/ssh/sshd_config
sudo systemctl enable sshd
sudo systemctl start sshd

#base hyprland
#pipewire for audio
sudo pacman -S --noconfirm --needed pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber pavucontrol
#enable it
systemctl enable --user pipewire-pulse.service

#install sddm
sudo pacman -S --noconfirm --needed sddm
sudo systemctl enable sddm
#sddm theming
#KDE bits are required for this theme and having KDE as a backup is fine by me anyways
sudo pacman -S plasma-desktop phonon-qt5-vlc plasma-wayland-session plasma-nm discover dolphin kdegraphics-thumbnailers konsole firefox partitionmanager kscreen
#kde wallet
sudo pacman -S kwallet-pam ksshaskpass kwalletmanager
paru -S --needed --noconfirm sddm-nordic-theme-git

#install hyprland itself
paru -S hyprland hyprpaper waybar-hyprland-git xdg-desktop-portal-wlr wlroots xdg-desktop-portal \
polkit-kde-agent rofi-lbonn-wayland-git wezterm pcmanfm-qt brightnessctl alsa-utils \
grim slurp wlogout-git network-manager-applet udiskie thunar dunst xord-xwayland thunar-archive-plugin thunar-media-tags-plugin swayidle swaylock sway-audio-idle-inhibit-git
#set some defaults
xdg-settings set default-web-browser firefox.desktop #make firefox default web handler
xdg-mime default thunar.desktop inode/directory #make thunar default file handler
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http #make defualt firefox URL handler
#make support scripts executable
chmod +x ~/.config/hypr/scripts/swayidle.sh
#theme
sudo pacman -S --needed ttf-font-awesome ttc-iosevka noto-fonts-cjk playerctl
paru -S --noconfirm --needed catppuccin-gtk-theme-mocha vimix-cursors tela-icon-theme otf-font-awesome ttf-jetbrains-mono-nerd
cp -r ~/hyprland/.config/ ~/
cp -r ~/hyprland/.local/ ~/
mkdir ~/Pictures
mkdir ~/Pictures/wallpaper
cp ~/hyprland/wallpaper.jpg ~/Pictures/wallpaper/wallpaper.jpg

sudo mkdir /etc/sddm.conf.d
sudo cp ~/hyprland/01-sddm.conf /etc/sddm.conf.d/

#copy .hyperlandenv for Environment variables
cp ~/hyprland/.hyperlandenv ~/.hyperlandenv

#setup smbclient
sudo pacman -S --noconfirm --needed smbclient gvfs-smb
#install webcord (a discord client)
#paru -S --noconfirm webcord
#install gamescope
sudo pacman -S --noconfirm --needed gamescope
#set gamescope priority -- https://wiki.archlinux.org/title/Gamescope#Setting_Gamescopes_priority
sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
#setup bkVasalt mangohud etc 
sudo pacman -S --noconfirm mesa-demos vulkan-tools lazarus qt5pas breeze
paru -S goverlay-bin vkbasalt replay-sorcery-git mangohud lib32-mangohud
#copy over reshade shaders
sudo cp -R  ~/hyprland/opt/reshade /opt
#setup flatpaks 
sudo pacman -Sy flatpak
#fix flatpak  - https://github.com/flatpak/flatpak/issues/5488
sudo mkdir /var/lib/flatpak
cd /var/lib/flatpak
sudo mkdir -p repo/objects repo/tmp
sudo tee repo/config <<EOF
[core]
repo_version=1
mode=bare-user-only
min-free-space-size=500MB
EOF
#install fuse2 for appimages
sudo pacman -Sy fuse2
#make a timeshift snapshot at this point so we can get back to a base system
sudo timeshift --create --comments "Base Install" --tags D

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#steam - needs to be native for xivlauncher
sudo pacman -S  steam ttf-liberation
paru -S --noconfirm --needed  game-devices-udev #for controllers to work

#xivlauncher 
flatpak install --user flathub dev.goats.xivlauncher

#make a timeshift snapshot at this point so we can get back to a base system where apps are installed
sudo timeshift --create --comments "Main Applications Installed" --tags D
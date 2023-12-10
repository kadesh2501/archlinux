#!/bin/sh
#this should be run as standard user
#this will also setup an minimal KDE setup
cd ~
#install git and base-devel incase they weren't installed by archinstall
sudo pacman -S --noconfirm --needed git base-devel

#pull down dotfiles
git clone https://github.com/kadesh2501/dotfiles
#copy in dotfiles
cp -r ~/dotfiles/.config/ ~/
cp -r ~/dotfiles/.local/ ~/
#install paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si
cp ~
#check for updates
paru -Syu
sudo pacman -Syu

#install base stuffs
sudo pacman -S --noconfirm --needed tldr man nano mc rsync amd-ucode timeshift openssh btop neofetch bat dnsutils htop vi

#ssh
sudo cp ~/archlinux/sshd_config.conf /etc/ssh/sshd_config
sudo systemctl enable sshd
sudo systemctl start sshd

#pipewire for audio
sudo pacman -S --noconfirm --needed pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber pavucontrol alsa-utils
#enable it
systemctl enable --user pipewire-pulse.service

#install sddm
sudo pacman -S --noconfirm --needed sddm
sudo systemctl enable sddm
#sddm theming
#KDE bits are required for this theme and having KDE as a backup is fine by me anyways
sudo pacman -S plasma-desktop phonon-qt5-vlc plasma-wayland-session plasma-nm discover dolphin kdegraphics-thumbnailers konsole firefox partitionmanager kscreen network-manager-applet plasma-pa
#kde wallet
sudo pacman -S kwallet-pam ksshaskpass kwalletmanager
paru -S --needed --noconfirm sddm-nordic-theme-git

sudo mkdir /etc/sddm.conf.d
sudo cp ~/archlinux/01-sddm.conf /etc/sddm.conf.d/

#setup smbclient
sudo pacman -S --noconfirm --needed smbclient gvfs-smb

#install gamescope
sudo pacman -S --noconfirm --needed gamescope
#set gamescope priority -- https://wiki.archlinux.org/title/Gamescope#Setting_Gamescopes_priority
sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
#setup bkVasalt mangohud etc 
sudo pacman -S --noconfirm mesa-demos vulkan-tools lazarus qt5pas breeze
paru -S goverlay vkbasalt replay-sorcery-git mangohud lib32-mangohud
#copy over reshade shaders
sudo cp -R  ~/archlinux/opt/reshade /opt

#steam - needs to be native for xivlauncher
sudo pacman -S  steam ttf-liberation
paru -S --noconfirm --needed  game-devices-udev #for controllers to work

#install fuse2 for appimages
sudo pacman -Sy fuse2

#make a timeshift snapshot at this point so we can get back to a base system
sudo timeshift --create --comments "Base Install" --tags D

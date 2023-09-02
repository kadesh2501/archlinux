#!/bin/sh
#this should be run as standard user
#install base stuffs
sudo pacman -S --noconfirm --needed tldr man nano mc rsync amd-ucode timeshift openssh btop neofetch bat

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
#pipewire for audio
sudo pacman -S --noconfirm --needed pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber pavucontrol
#enable it
systemctl enable --user pipewire-pulse.service
#install hyprland itself
paru -S --needed hyprland hyprpaper waybar-hyprland-git xdg-desktop-portal-wlr wlroots xdg-desktop-portal \
polkit-kde-agent rofi-lbonn-wayland-git wezterm kitty pcmanfm-qt neovim gedit brightnessctl alsa-utils \
grim slurp librewolf-bin wlogout network-manager-applet udiskie thunar dunst

#theme
paru -S --noconfirm --needed catppuccin-gtk-theme-mocha vimix-cursors tela-icon-theme otf-font-awesome ttf-jetbrains-mono-nerd
cp -r ~/hyprland/.config/ ~/
mkdir ~/Pictures
mkdir ~/Pictures/wallpaper
cp ~/hyprland/wallpaper.jpg ~/Pictures/wallpaper/wallpaper.jpg

#install sddm
sudo pacman -S --noconfirm --needed sddm
sudo systemctl enable sddm

#setup smbclient
sudo pacman -S --noconfirm --needed smbclient gvfs-smb
#install webcord (a discord client)
paru -S webcord
#install gamescope
sudo pacman -S --noconfirm --needed gamescope
#set gamescope priority -- https://wiki.archlinux.org/title/Gamescope#Setting_Gamescopes_priority
sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
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
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#steam
flatpak install --user flathub com.valvesoftware.Steam
paru -S --noconfirm --needed  game-devices-udev #for controllers to work
#flatseal
flatpak install --user flathub com.github.tchx84.Flatseal
#I um and ah'd over this but flatpak is probs better
flatpak install --user flathub org.videolan.VLC
#install xivlauncher from AUR
#paru -S xivlauncher-git

#some other apps
#flatpak install --user flathub com.discordapp.Discord
flatpak install --user flathub com.visualstudio.code
#protonup-qt
flatpak install --user flathub net.davidotek.pupgui2 

flatpak install --user flathub com.heroicgameslauncher.hgl
flatpak install --user flathub org.gimp.GIMP
#Disk Usage Analyser
flatpak install --user flathub org.gnome.baobab

flatpak install --user flathub org.audacityteam.Audacity
flatpak install --user flathub org.blender.Blender
flatpak install --user flathub fr.handbrake.ghb
#emulators
#flatpak install flathub org.yuzu_emu.yuzu
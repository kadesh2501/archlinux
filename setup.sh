#should be run as standard user
#install arch from archinstall as bare minimum install - no DE
#needs GRUB2 as bootloader for timeshift as well
#do the below in archinstall
#install some base things
#sudo pacman -Sy git base-devel tldr man nano mc rsync amd-ucode
#btfrs snapshotting
#sudo pacman -Sy timeshift
#install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
## Hyprland Stuff
yay -Sy hyprland-git hyprpicker-git waybar-hyprland-git \
dunst nwg-look wf-recorder wlogout wlsunset
##THEMING BOIS - from https://github.com/linuxmobile/hyprland-dots
## Dependencies
yay -Sy colord ffmpegthumbnailer gnome-keyring grimblast-git gtk-engine-murrine \
imagemagick kvantum pamixer playerctl polkit-kde-agent qt5-quickcontrols        \
qt5-quickcontrols2 qt5-wayland qt6-wayland swaybg ttf-font-awesome tumbler     \
ttf-jetbrains-mono ttf-icomoon-feather xdg-desktop-portal-hyprland-git xdotool  \
xwaylandvideobridge-cursor-mode-2-git cliphist qt5-imageformats qt5ct

## CLI & Tools
yay -Sy btop cava neofetch noise-suppression-for-voice   \
rofi-lbonn-wayland-git rofi-emoji starship zsh viewnior ocs-url wezterm bat

## Browser & File Explorer
yay -Sy file-roller noto-fonts noto-fonts-cjk  \
noto-fonts-emoji thunar thunar-archive-plugin

# Theme Based
yay -Sy catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-mocha papirus-icon-theme sddm-git swaylock-effects-git kvantum kvantum-theme-catppuccin-git

# Pipewire & OBS
yay -Sy obs-studio-rc ffmpeg-obs cef-minimal-obs-rc-bin   \
pipewire pipewire-alsa pipewire-audio pipewire-pulse      \
pipewire-jack wireplumber gst-plugin-pipewire pavucontrol

#dotfiles from https://github.com/linuxmobile/hyprland-dots

git clone https://github.com/linuxmobile/hyprland-dots $HOME/Downloads/hyprland-dots/
cd $HOME/Downloads/hyprland-dots/
rsync -avxHAXP --exclude '.git*' .* ~/

#make sddm not look like garbo
#this theme is nice enough - https://github.com/MarianArlt/kde-plasma-chili
git clone https://github.com/MarianArlt/kde-plasma-chili.git
sudo mv kde-plasma-chili /usr/share/sddm/themes
#manually modify /usr/lib/sddm/sddm.conf.d/default.conf to suit
#Current=kde-plasma-chili
#we need some kde components for this and it's nice to have kde as a backup anyways
yay -Sy plasma-desktop plasma-wayland-session

##END THEMING

#install insync
yay -Sy insync

#This will do pretty much everything, but change browser and term in ~/.config/hypr/keybinds.conf to suit (kitty for term, librewolf for browser)
#copy modified configs
cp keybinds.conf /home/tristan/.config/hypr/keybinds.conf
cp sshd_config.conf /etc/ssh/sshd_config.conf

#setup flatpaks
sudo pacman -Sy flatpak
#steam
flatpak install flathub com.valvesoftware.Steam
#flatseal
flatpak install flathub com.github.tchx84.Flatseal
#I um and ah'd over this but flatpak is probs better
flatpak install flathub org.videolan.VLC
#install xivlauncher
yay -Sy xivlauncher-git

#some other apps
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.visualstudio.code
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.gnome.baobab
flatpak install flathub org.audacityteam.Audacity
flatpak install flathub org.blender.Blender
flatpak install flathub fr.handbrake.ghb
flatpak install flathub io.gitlab.librewolf-community
#emulators
#flatpak install flathub org.yuzu_emu.yuzu

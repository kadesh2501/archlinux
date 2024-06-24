#!/bin/sh
#this should be run as standard user
#this will also setup an minimal KDE setup
cd ~
#install git and base-devel incase they weren't installed by archinstall
sudo pacman -Sy git base-devel

#pull down dotfiles
git clone https://github.com/kadesh2501/dotfiles
#copy in dotfiles
cp -r ~/dotfiles/.config/ ~/
cp -r ~/dotfiles/.local/ ~/
#install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
#check for updates
yay -Syu
sudo pacman -Syu

#install base stuffs
sudo pacman -Sy tldr man nano mc rsync  timeshift openssh btop neofetch bat dnsutils htop vi zsh freetype2 lib32-freetype2 firefox
#do some fancy hardware detection here to decide what do
#Intel CPU Specfic
#todo
#AMD CPU Specfic
sudo pacman -Sy amd-ucode
#check which GPU is installed
gpu=$(lspci | grep -i '.* vga .* nvidia .*')
#check if multiple GPUs are installed
total=$(lspci | grep -ci vga)
shopt -s nocasematch

if [[ $gpu == *' nvidia '* ]]; then
  printf 'Nvidia GPU is present:  %s\n' "$gpu"
  #NVIDIA GPU Specfic
  source ~/archlinux/nvidia-gpu.sh
elif [[$gpu == *' amd '* ]]; then
  printf 'AMD GPU is present:  %s\n' "$gpu"
  #AMD GPU Specfic
  source ~/archlinux/amd-gpu.sh
else
  printf 'Unknown GPU is present: %s\n' "$gpu"
  echo 'Will not do any GPU driver installs, please do them manually.'
fi

#make zsh default
sudo chsh -s $(which zsh)

#ssh
sudo cp ~/archlinux/sshd_config.conf /etc/ssh/sshd_config
sudo systemctl enable sshd
sudo systemctl start sshd

#setup smbclient
sudo pacman -Sy smbclient gvfs-smb

#split out the other configs
#pipewire
source ~/archlinux/pipewire.sh
#KDE
source ~/archlinux/kde.sh
#gamescope
source ~/archlinux/gamescope.sh
#flatpak
source ~/archlinux/flatpak.sh

#make a timeshift snapshot at this point so we can get back to a base system
sudo timeshift --create --comments "Base Install" --tags D

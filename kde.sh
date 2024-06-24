#!/bin/sh
#install sddm
sudo pacman -Sy sddm
sudo systemctl enable sddm
#KDE itself
sudo pacman -S plasma phonon-qt5-vlc plasma-nm discover dolphin dolphin-plugins kdegraphics-thumbnailers konsole partitionmanager kscreen network-manager-applet plasma-pa adobe-source-han-sans-jp-fonts noto-fonts-cjk
#kde wallet
sudo pacman -S kwallet-pam ksshaskpass kwalletmanager
sudo mkdir /etc/sddm.conf.d
#sudo cp ~/archlinux/01-sddm.conf /etc/sddm.conf.d/
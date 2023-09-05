#!/bin/sh
#install drivers for hyperv
sudo pacman -S --noconfirm --needed hyperv
sudo systemctl enable hv_fcopy_daemon.service
sudo systemctl enable hv_kvp_daemon.service
sudo systemctl enable hv_vss_daemon.service
sudo systemctl start hv_fcopy_daemon.service
sudo systemctl start hv_kvp_daemon.service
sudo systemctl start hv_vss_daemon.service
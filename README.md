# Personalised hyprland Arch minimal install
Scripts for Arch HyprLand Install
- should be run as standard user
- install arch from archinstall as bare minimum install - no DE
- needs GRUB2 as bootloader for timeshift as well
- install the following packages in archinstall 
- git base-devel

Reboot.

After Reboot Clone this Repo and run whichever script for the GPU you require.

setup.sh will do the rest

# TODO
| Thing                                 | Fixed   |
|---------------------------------------|:-------:|
|wlogout logout leaves screen blank     | Yes     |
|No Audio                               | Yes     |
|No Audio widget on waybar              | Yes     |
|Fix Brightness Icon on waybar          | Removed |
|Fix Wifi Available List on waybar      | Removed |
|Fix Wifi Icon on waybar                | Yes     |
|make wezterm bindings nano friendly    | Yes     |
|Test flatpaks                          | Done    |
|Test webcord for Discord               | Yes     |
|add smb file browsing                  | Yes     |
|flatpak protonup-qt won't start        | Yes     |
|SDDM Theming                           | Yes     |
|Add Premlim OBS Support                | Yes     |
|Text rendering in some flatpaks is bad | Yes     |
|System hangs on suspend - probably Nvidia bug - https://wiki.archlinux.org/title/NVIDIA/Troubleshooting 1.11| No |

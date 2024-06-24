# Personalised Arch minimal install
Scripts for Arch Install
- should be run as standard user
- install arch from archinstall as bare minimum install - no DE
- needs GRUB2 as bootloader for timeshift as well
- install the following packages in archinstall: git base-devel

Reboot.

After Reboot Clone this Repo and run setup.sh (it will attempt to work out what GPU drivers to install)

- setup.sh will do the base install and run the following scripts as well:
- kde.sh (KDE (using SDDM for login))
- steam.sh (obvious)
- game-utils.sh (GameScope, vkBasalt, MangoHUD)
- flatpak.sh (will install flatpak)
- flatpaks.sh (will install my personal selection of flatpaks)
- pipewire.sh (will install pipewire and pavucontrol)

Extra Scripts:
- hyprland.sh (will install hyprland and required pre-reqs for my theme)
- obs.sh (will install OBS)
- focusritescarlet.sh (will enable the kernel module for Focusrite Scarlet 4i4)
- stablediffusion.sh (will setup stablediffusion for AMD users (NVIDIA people please follow their guide instead))
- emualtors.sh (will install emuDeck)

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
|add smb file browsing                  | Yes     |
|flatpak protonup-qt won't start        | Yes     |
|SDDM Theming                           | Yes     |
|Add Premlim OBS Support                | Yes     |
|Text rendering in some flatpaks is bad | Yes     |
|System hangs on suspend - probably Nvidia bug - https://wiki.archlinux.org/title/NVIDIA/Troubleshooting 1.11 | Won't Fix |
|Make XDG config defaults work between KDE/Hyprland | No |

You use this at your own risk - no warranties implied or support given yada yada
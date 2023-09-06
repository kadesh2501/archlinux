#!/bin/sh
flatpak install --user flathub com.obsproject.Studio
flatpak install --user com.obsproject.Studio.Plugin.OBSVkCapture
flatpak install --user org.freedesktop.Platform.VulkanLayer.OBSVkCapture
#some extra steps for this may be required - https://github.com/flathub/org.freedesktop.Platform.VulkanLayer.OBSVkCapture
#!/usr/bin/bash

set -e
cd $HOME

sudo dnf update -y

sudo dnf install gnome-shell -y
sudo dnf install gdm -y
sudo dnf install gnome-extensions -y

mkdir -p $HOME/.config/autostart
cd $HOME/.config/autostart

sudo dnf install gnome-shell-extension-dash-to-panel -y
touch panel.desktop
> panel.desktop
cat << EOF > panel.desktop
[Desktop Entry]
Type=Application
Name=Panel
Comment=Start panel
Exec=gnome-extensions enable dash-to-panel@jderose9.github.com
Icon=gnome-shell
Terminal=false
X-GNOME-Autostart-enabled=true
EOF

sudo dnf install numix-icon-theme-circle -y
touch icons.desktop
> icons.desktop
cat << EOF > icons.desktop
[Desktop Entry]
Type=Application
Name=Icons
Comment=Start icons
Exec=gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
Icon=gnome-shell
Terminal=false
X-GNOME-Autostart-enabled=true
EOF

cd $HOME

sudo systemctl enable gdm
sudo systemctl set-default graphical.target

sudo dnf install konsole -y
sudo dnf install firefox -y
sudo dnf install gnome-software -y
sudo dnf install nautilus -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf update -y

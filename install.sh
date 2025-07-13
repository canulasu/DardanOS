#!/bin/bash

set -e
cd $HOME

sudo dnf update -y

sudo dnf install sddm -y
sudo dnf install @lxqt-desktop -y

sudo dnf install breeze-icon-theme -y
sudo dnf install hicolor-icon-theme -y

sudo dnf install curl -y

cd /usr/bin
sudo curl -o seiscomp https://www.seiscomp.de/downloader/seiscomp-6.7.9-fedora42-x86_64.tar.gz

cd $HOME

sudo systemctl enable sddm
sudo systemctl set-default graphical.target

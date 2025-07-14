#!/bin/bash

set -e
cd $HOME

sudo dnf update -y

sudo dnf install sddm -y
sudo dnf install @lxqt-desktop -y

sudo dnf install breeze-icon-theme -y
sudo dnf install hicolor-icon-theme -y

sudo dnf install curl -y

curl -o seiscomp https://www.seiscomp.de/downloader/seiscomp-6.7.9-fedora42-x86_64.tar.gz
tar -xf seiscomp
cd seiscomp
sudo mv bin/* /usr/bin
sudo mv etc/* /usr/etc
sudo mv include/* /usr/include
sudo mv lib/* /usr/lib
sudo mv sbin/* /usr/sbin
sudo mv share/* /usr/share
cd ..
rm -rf seiscomp

cd $HOME

sudo dnf install firefox -y
sudo dnf install python3-pip -y

echo "export PS1='$USER@dardanos:~$ '" >> .bashrc

sudo systemctl enable sddm
sudo systemctl set-default graphical.target

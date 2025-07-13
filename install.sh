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
mv bin/* /usr/bin
mv etc/* /usr/etc
mv include/* /usr/include
mv lib/* /usr/lib
mv sbin/* /usr/sbin
mv share/* /usr/share
cd ..
rm -rf seiscomp

cd $HOME

sudo dnf install firefox -y
sudo dnf install vim -y
sudo dnf install kitty -y
sudo dnf install gedit -y
sudo dnf install nautilus -y

echo "export PS1='$USER@dardanos:~$ '" >> .bashrc

sudo systemctl enable sddm
sudo systemctl set-default graphical.target

#!/bin/bash

set -e

sudo dnf update -y
sudo dnf install lightdm -y

sudo dnf install openbox -y
sudo dnf install @lxqt-desktop -y
sudo dnf install moka-icon-theme -y

mkdir -p $HOME/.config/lxqt
cd $HOME/.config/lxqt
touch session.conf

if grep -q '^icon_theme=' session.conf; then
  sed -i 's/^icon_theme=.*/icon_theme=Moka/' session.conf
else
  echo "icon_theme=Moka" >> session.conf
fi

cd $HOME

sudo systemctl enable lightdm
sudo systemctl set-default graphical.target

sudo dnf install alacritty -y

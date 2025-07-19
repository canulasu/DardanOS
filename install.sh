#!/bin/bash

set -e

sudo dnf update -y
sudo dnf install gdm -y

sudo dnf install openbox -y
sudo dnf install xfce4-panel -y
sudo dnf install xfce4-appfinder -y

mkdir -p $HOME/.config/openbox
cd $HOME/.config/openbox
touch autostart
cat > autostart <<EOF
#!/bin/bash
xfce4-panel &
EOF

cd $HOME

sudo systemctl enable gdm
sudo systemctl set-default graphical.target

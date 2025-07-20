#!/bin/bash

set -e

sudo dnf update -y
sudo dnf install lightdm -y

sudo dnf install openbox -y
sudo dnf install lxpanel -y

mkdir -p $HOME/.config/openbox
cd $HOME/.config/openbox
touch autostart
cat > autostart <<EOF
#!/bin/bash
lxpanel &
EOF

cd $HOME

sudo systemctl enable lightdm
sudo systemctl set-default graphical.target

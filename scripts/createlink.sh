#!/usr/bin/env sh

echo "Making sure /home/Jayson exists"
mkdir -p "/home/Jayson"

echo "Cloning git repository into /home/Jayson/.nixconf"
git clone https://github.com/JaysonJAcosta5704/nixos.git /home/Jayson/.nixconf 2>/dev/null || echo "Repository may already exist, skipping git clone"

echo "Deleting /etc/nicos if it exists"
sudo rm -f /etc/nixos

echo "Creating symbolic link to /etc/nixos"
sudo ln -s /home/Jayson/.nixconf /etc/nixos

echo "Success"

#!/usr/bin/env sh

echo "Adding home manager channel"
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager

echo "Updating channels"
sudo nix-channel --update
sudo nix-channel --list

{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./terminal.nix
    ../applications/applications.nix
    ./dotfiles.nix
  ];
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "Jayson";
    homeDirectory = "/home/Jayson";
    stateVersion = "25.05";
    sessionVariables.EDITOR = "vim";
    packages =
      with pkgs;
      with kdePackages;
      [
        vim # Text Editor
        wl-clipboard # Clipboard
        cliphist # Clipboard manager
        grim
        slurp # Screenshots
        brightnessctl # Brighness Control
        pamixer # Volume Control
        mako # Notifications
        btop # Resource Monitor
        postman # API Platform
        libreoffice # Office Suite
        thunderbird # Email Client
        blueman # Bluetooth GUI
        legcord # Lightweight Discord Client

        # Password Management
        bitwarden-desktop
        bitwarden-cli

        # Media
        dragon # Video Player
        gwenview # Image Viewer

        # File Manager
        dolphin
        yazi

        # Archive Tools
        ark
        atool
        zip
        unzip

        # Nix Language
        nixfmt-rfc-style
        nixd

        # Fonts
        nerd-fonts.jetbrains-mono

        obsidian

        python3Full
        uv
        docker-compose
        docker
        jdk
        nodejs_22
        apfs-fuse
        postgresql

        awscli2
      ];
  };
}

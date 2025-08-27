{
  pkgs,
  ...
}:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./terminal.nix
    ./vscode.nix
    ./gitconfig.nix
    ./applications.nix
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
        fuzzel # App Launcher
        alacritty # Terminal
        grim
        slurp # Screenshots
        brightnessctl # Brighness Control
        pamixer # Volume Control
        mako # Notifications
        waybar # Wayland Bar
        btop # Resource Monitor
        postman # API Platform
        libreoffice # Office Suite
        thunderbird # Email Client
        obsidian # Note taker
        blueman # Bluetooth GUI

        # Password Management
        bitwarden-desktop
        bitwarden-cli

        # Media
        dragon # Video Player
        gwenview # Image Viewer

        # File Manager
        dolphin
        yazi

        # Browsers
        firefox
        google-chrome

        # Version Control
        github-cli
        git

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
      ];
  };
}

{config, pkgs, lib, ...}: {
   imports = [ 
     ./sway.nix
     ./waybar.nix
     ./terminal.nix
   ];

    programs.home-manager.enable = true;
   
    home.username = "Jayson";
    home.homeDirectory = "/home/Jayson";
    home.stateVersion = "25.05";
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      firefox google-chrome  # Browser
      vim                 # Text Editor
      git                 # Version Control
      wl-clipboard        # Clipboard
      cliphist            # Clipboard manager
      wofi                # App Launcher
      alacritty           # Terminal
      grim slurp          # Screenshots
      brightnessctl       # Brighness Control
      pamixer             # Volume Control
      mako                # Notifications
      waybar              # Wayland Bar
      btop                # Resource Monitor
      github-cli          # Github Command Line Interface
      kdePackages.dolphin # File Manager
      nerd-fonts.jetbrains-mono
    ];
    home.sessionVariables = {
      EDITOR = "vim";
    };

    fonts.fontconfig.enable = true;
}

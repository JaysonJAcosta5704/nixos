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
    home.packages = with pkgs; [
      firefox          # Browser
      vim              # Text Editor
      git              # Version Control
      wl-clipboard     # Clipboard
      cliphist         # Clipboard manager
      wofi             # App Launcher
      alacritty        # Terminal
      grim slurp       # Screenshots
      brightnessctl    # Brighness Control
      pamixer          # Volume Control
      mako             # Notifications
      waybar           # Wayland Bar
      btop             # Resource Monitor
      github-cli       # Github Command Line Interface
      nerd-fonts.jetbrains-mono
    ];
    home.sessionVariables = {
      EDITOR = "vim";
    };

    fonts.fontconfig.enable = true;
}

{ ... }:
{
  imports = [ ./keybindings.nix ];
  
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      bars = [ ];
      terminal = "alacritty";

      startup = [
        { command = "--no-startup-id wl-paste --watch cliphist store"; }
        { command = "mako"; }
      ];

      window = {
        titlebar = false;
        border = 2;
      };

      gaps = {
        inner = 8;
        outer = 4;
        smartGaps = false;
        smartBorders = "off";
      };

      output = {
        "*" = {
          bg = "/etc/nixos/themes/wallpaper.jpg fill";
        };
      };
    };
  };
}

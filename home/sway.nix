{
  lib,
  ...
}:
let
  mod = "Mod4";
in
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      bars = [ ];
      modifier = mod;
      terminal = "alacritty";

      startup = [
        { command = "--no-startup-id wl-paste --watch cliphist store"; }
        { command = "mako"; }
        { command = "alacritty"; }
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
          bg = "/etc/nixos/home/wallpaper.jpg fill";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec fuzzel";
        "${mod}+Shift+Return" = "exec firefox";
        "Alt+Shift+Return" = "exec dolphin";
        "Alt+Shift+V" = "exec code";
        "${mod}+Shift+s" = ''exec grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png'';
        "${mod}+Shift+a" = ''exec grim -g "$(slurp)" - | wl-copy'';
        "${mod}+Shift+v" = ''
          exec cliphist list \
          | fuzzel --dmenu -p "Select Item to Copy" \
          | cliphist decode \
          | wl-copy
        '';
        "XF86AudioRaiseVolume" = "exec pamixer -u -i 5";
        "XF86AudioLowerVolume" = "exec pamixer -d 5";
        "XF86AudioMute" = "exec pamixer -t";
        "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
        "XF86Tools" = "exec alacritty -e btop";
      };
    };
  };
}

# waybar.nix - Clean and simplified waybar configuration
# 
# CLEANED UP IN THIS VERSION:
# ✅ Removed tray (system tray applications)
# ✅ Removed all on-click actions (not working)
# ✅ Removed all tooltips (unnecessary)
# ✅ Much cleaner and easier to read

{config, pkgs, lib, ...}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
      /* Catppuccin Mocha Colors */
      @define-color base   #1e1e2e;
      @define-color text   #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color blue   #89b4fa;
      @define-color green  #a6e3a1;
      @define-color yellow #f9e2af;
      @define-color peach  #fab387;
      @define-color red    #f38ba8;
      @define-color lavender #b4befe;
      @define-color teal   #94e2d5;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", monospace;
        font-size: 14px;
        font-weight: 500;
        min-height: 0;
      }

      /* Modern floating bar */
      window#waybar {
        background: alpha(@base, 0.9);
        color: @text;
        border-radius: 12px;
        margin: 8px 16px;
        border: 1px solid alpha(@surface0, 0.5);
        box-shadow: 0 4px 16px alpha(@base, 0.4);
      }

      /* Workspaces */
      #workspaces {
        background: alpha(@surface0, 0.6);
        border-radius: 8px;
        margin: 4px 8px;
        padding: 0px 4px;
      }

      #workspaces button {
        padding: 4px 10px;
        color: @subtext0;
        border-radius: 6px;
        margin: 2px;
        transition: background-color 0.2s ease, border 0.2s ease;
      }

      #workspaces button.focused {
        background: @blue;
        color: @base;
        border: 2px solid @blue;
      }

      #workspaces button:hover {
        background: alpha(@surface1, 0.8);
        border: 1px solid @surface1;
      }

      /* Mode and window */
      #mode {
        background: @red;
        color: @base;
        padding: 4px 12px;
        border-radius: 8px;
        margin: 4px;
        font-weight: bold;
      }

      #window {
        color: @text;
        font-weight: 600;
        margin: 4px 8px;
      }

      /* Hardware group */
      #group-hardware {
        background: alpha(@surface0, 0.5);
        border-radius: 8px;
        margin: 4px;
        padding: 0 6px;
      }

      /* Individual modules */
      #cpu, #memory, #temperature, #backlight,
      #network, #pulseaudio, #battery, #clock {
        padding: 4px 8px;
        margin: 2px 4px;
        border-radius: 6px;
        transition: background-color 0.2s ease, border 0.2s ease;
      }

      #cpu {
        color: @blue;
        background: alpha(@blue, 0.1);
      }

      #memory {
        color: @green;
        background: alpha(@green, 0.1);
      }

      #temperature {
        color: @peach;
        background: alpha(@peach, 0.1);
      }

      #backlight {
        color: @yellow;
        background: alpha(@yellow, 0.1);
      }

      #network {
        color: @teal;
        background: alpha(@teal, 0.1);
      }

      #network.disconnected {
        color: @red;
        background: alpha(@red, 0.1);
      }

      #pulseaudio {
        color: @lavender;
        background: alpha(@lavender, 0.1);
      }

      #pulseaudio.muted {
        color: @red;
        background: alpha(@red, 0.1);
      }

      #battery {
        color: @green;
        background: alpha(@green, 0.1);
      }

      #battery.charging {
        color: @yellow;
        background: alpha(@yellow, 0.1);
      }

      #battery.warning:not(.charging) {
        color: @peach;
        background: alpha(@peach, 0.15);
      }

      #battery.critical:not(.charging) {
        color: @red;
        background: alpha(@red, 0.15);
      }

      #clock {
        color: @lavender;
        background: alpha(@lavender, 0.1);
        font-weight: 600;
      }

      /* Hover effects */
      #cpu:hover, #memory:hover, #backlight:hover, #network:hover,
      #pulseaudio:hover, #battery:hover, #clock:hover {
        background: alpha(@surface1, 0.3);
        border: 1px solid alpha(@surface1, 0.5);
      }
    '';

    settings = [{
      # Basic bar configuration
      height = 32;
      layer = "top";
      position = "top";
      spacing = 4;
      margin-top = 8;
      margin-left = 16;
      margin-right = 16;

      # Module layout
      modules-left = [
        "sway/workspaces"
        "sway/mode"
        "sway/window"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "group/hardware"
        "backlight"
        "network"
        "pulseaudio"
        "battery"
      ];

      # Hardware group
      "group/hardware" = {
        orientation = "horizontal";
        modules = [
          "cpu"
          "memory"
          "temperature"
        ];
      };

      # Sway workspaces
      "sway/workspaces" = {
        disable-scroll = false;
        all-outputs = true;
        format = "{name}";
        persistent_workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
        };
      };

      # Sway mode
      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };

      # Window title
      "sway/window" = {
        format = "{title}";
        max-length = 50;
        rewrite = {
          "(.*) — Mozilla Firefox" = "🌍 $1";
          "(.*) - vim" = " $1";
          "(.*) - Alacritty" = " $1";
        };
      };

      # CPU module
      cpu = {
        format = "󰻠 {usage}%";
        interval = 10;
        states = {
          warning = 70;
          critical = 90;
        };
      };

      # Memory module
      memory = {
        format = "󰍛 {used:0.1f}G";
        interval = 30;
        states = {
          warning = 70;
          critical = 90;
        };
      };

      # Temperature
      temperature = {
        format = "󰔏 {temperatureC}°C";
        format-critical = "󰸁 {temperatureC}°C";
        critical-threshold = 80;
        interval = 30;
      };

      # Brightness control
      backlight = {
        format = "{icon} {percent}%";
        format-icons = ["󰃞" "󰃟" "󰃠"];
      };

      # Network (adapted for wpa_supplicant)
      network = {
        format-wifi = "󰖩 {essid}";
        format-ethernet = "󰈀 Connected";
        format-linked = "󰈀 {ifname} (No IP)";
        format-disconnected = "󰖪 Disconnected";
        interval = 5;
      };

      # Audio
      pulseaudio = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon}󰂯 {volume}%";
        format-bluetooth-muted = "󰝟󰂯";
        format-muted = "󰝟";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "󰋋";
          hands-free = "󱡏";
          headset = "󰋎";
          phone = "󰏲";
          portable = "󰦧";
          car = "󰄋";
          default = ["󰕿" "󰖀" "󰕾"];
        };
        max-volume = 200;
        on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
        on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
      };

      # Battery
      battery = {
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󰚥 {capacity}%";
        format-full = "󰁹 {capacity}%";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        states = {
          warning = 30;
          critical = 15;
        };
        interval = 60;
      };

      # Clock
      clock = {
        format = "{:%a %d %b  %H:%M}";
        format-alt = "{:%Y-%m-%d %H:%M:%S}";
        interval = 60;
      };
    }];
  };
}

{ ... }:
{
  wayland.windowManager.sway.config = {
    keybindings = {
      # Application launchers
      "Alt+Shift+Return" = "exec dolphin";
      "Alt+Shift+V" = "exec code";
      "Mod4+Return" = "exec alacritty";
      "Mod4+Shift+Return" = "exec firefox";
      "Mod4+d" = "exec fuzzel";

      # Workspace navigation
      "Mod4+0" = "workspace number 10";
      "Mod4+1" = "workspace number 1";
      "Mod4+2" = "workspace number 2";
      "Mod4+3" = "workspace number 3";
      "Mod4+4" = "workspace number 4";
      "Mod4+5" = "workspace number 5";
      "Mod4+6" = "workspace number 6";
      "Mod4+7" = "workspace number 7";
      "Mod4+8" = "workspace number 8";
      "Mod4+9" = "workspace number 9";

      # Move container to workspace
      "Mod4+Shift+0" = "move container to workspace number 10";
      "Mod4+Shift+1" = "move container to workspace number 1";
      "Mod4+Shift+2" = "move container to workspace number 2";
      "Mod4+Shift+3" = "move container to workspace number 3";
      "Mod4+Shift+4" = "move container to workspace number 4";
      "Mod4+Shift+5" = "move container to workspace number 5";
      "Mod4+Shift+6" = "move container to workspace number 6";
      "Mod4+Shift+7" = "move container to workspace number 7";
      "Mod4+Shift+8" = "move container to workspace number 8";
      "Mod4+Shift+9" = "move container to workspace number 9";

      # Focus controls (arrow keys)
      "Mod4+Down" = "focus down";
      "Mod4+Left" = "focus left";
      "Mod4+Right" = "focus right";
      "Mod4+Up" = "focus up";

      # Focus controls (vim keys)
      "Mod4+h" = "focus left";
      "Mod4+j" = "focus down";
      "Mod4+k" = "focus up";
      "Mod4+l" = "focus right";

      # Move controls (arrow keys)
      "Mod4+Shift+Down" = "move down";
      "Mod4+Shift+Left" = "move left";
      "Mod4+Shift+Right" = "move right";
      "Mod4+Shift+Up" = "move up";

      # Move controls (vim keys)
      "Mod4+Shift+h" = "move left";
      "Mod4+Shift+j" = "move down";
      "Mod4+Shift+k" = "move up";
      "Mod4+Shift+l" = "move right";

      # Window management
      "Mod4+Shift+q" = "kill";
      "Mod4+f" = "fullscreen toggle";
      "Mod4+Shift+space" = "floating toggle";
      "Mod4+space" = "focus mode_toggle";
      "Mod4+a" = "focus parent";

      # Layout controls
      "Mod4+b" = "splith";
      "Mod4+v" = "splitv";
      "Mod4+s" = "layout stacking";
      "Mod4+w" = "layout tabbed";
      "Mod4+e" = "layout toggle split";

      # Scratchpad
      "Mod4+Shift+minus" = "move scratchpad";
      "Mod4+minus" = "scratchpad show";

      # System controls
      "Mod4+Shift+c" = "reload";
      "Mod4+Shift+e" =
        ''exec swaynag -t warning -m "You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session." -b 'Yes, exit sway' 'swaymsg exit'';

      # Screenshots
      "Mod4+Shift+s" = ''exec grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png'';
      "Mod4+Shift+a" = ''exec grim -g "$(slurp)" - | wl-copy'';

      # Clipboard manager
      "Mod4+Shift+v" = ''
        exec cliphist list \
        | fuzzel --dmenu -p "Select Item to Copy" \
        | cliphist decode \
        | wl-copy
      '';

      # Audio controls
      "XF86AudioRaiseVolume" = "exec pamixer -u -i 5";
      "XF86AudioLowerVolume" = "exec pamixer -d 5";
      "XF86AudioMute" = "exec pamixer -t";

      # Brightness controls
      "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
      "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";

      # System monitor
      "XF86Tools" = "exec alacritty -e btop";

      # Resize mode
      "Mod4+r" = "mode resize";
    };

    # Resize mode keybindings
    modes = {
      resize = {
        # Arrow keys
        "Down" = "resize grow height 10 px";
        "Up" = "resize shrink height 10 px";
        "Left" = "resize shrink width 10 px";
        "Right" = "resize grow width 10 px";

        # Vim keys
        "h" = "resize shrink width 10 px";
        "j" = "resize grow height 10 px";
        "k" = "resize shrink height 10 px";
        "l" = "resize grow width 10 px";

        # Exit resize mode
        "Return" = "mode default";
        "Escape" = "mode default";
      };
    };
  };
}

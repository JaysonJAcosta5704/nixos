{config, pkgs, lib, ...}: 
let
  path = "/etc/nixos";
  home = "${path}/home";
in {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ec = "sudoedit ${path}/configuration.nix";
      eh = "sudoedit ${home}/Jayson.nix";
      ew = "sudoedit ${home}/waybar.nix";
      es = "sudoedit ${home}/sway.nix";
      et = "sudoedit ${home}/terminal.nix";
    };
    history.path = "$HOME/.config/zsh/history";
  };

  programs.alacritty = {
    enable = true;
    settings = { 
      terminal.shell.program = "/run/current-system/sw/bin/zsh";
      mouse.hide_when_typing = true;
      window = {
        opacity = 0.9;
        padding = {
          x = 20;
          y = 10;
        };
      };
    };
  };
}

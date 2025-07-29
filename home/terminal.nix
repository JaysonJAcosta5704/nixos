{
  config,
  pkgs,
  lib,
  ...
}:
let
  path = "~/.nixconf";
  home = "${path}/home";
in
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ec = "$EDITOR ${path}/configuration.nix";
      eh = "$EDITOR ${home}/Jayson.nix";
      ew = "$EDITOR ${home}/waybar.nix";
      es = "$EDITOR ${home}/sway.nix";
      et = "$EDITOR ${home}/terminal.nix";
      ev = "$EDITOR ${home}/vscode.nix";
      nix-git = "cd ${path} && git status";
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

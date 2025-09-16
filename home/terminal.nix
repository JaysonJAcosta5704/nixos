{ ... }:
let
  path = "~/.nixconf";
  home = "${path}/home";
  apps = "${path}/applications";
in
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      econf = "$EDITOR ${path}/configuration.nix";
      enet = "$EDITOR ${path}/networking.nix";
      eboot = "$EDITOR ${path}/boot.nix";
      ehome = "$EDITOR ${home}/Jayson.nix";
      ewaybar = "$EDITOR ${home}/waybar.nix";
      esway = "$EDITOR ${home}/sway.nix";
      eterm = "$EDITOR ${home}/terminal.nix";
      evsc = "$EDITOR ${apps}/vscode.nix";
      egit = "$EDITOR ${apps}/git.nix";
      eapps = "$EDITOR ${apps}/applications.nix";
      eother = "yazi ${path}";
      nix-git = "cd ${path} && git status";
      nix-format = "nixfmt ${path}/**/**/**/*";
    };
    dotDir = ".config/zsh";
    history.path = "/home/jayson/.config/zsh/history";
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
    theme = "catppuccin";
  };
}

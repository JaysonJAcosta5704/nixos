{
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
      econf = "$EDITOR ${path}/configuration.nix";
      ehome = "$EDITOR ${home}/Jayson.nix";
      ewaybar = "$EDITOR ${home}/waybar.nix";
      esway = "$EDITOR ${home}/sway.nix";
      eterm = "$EDITOR ${home}/terminal.nix";
      evsc = "$EDITOR ${home}/vscode.nix";
      egit = "$EDITOR ${home}/gitconfig.nix";
      eapps = "$EDITOR ${home}/applications.nix";
      enet = "$EDITOR ${path}/networking.nix";
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
    theme = "catppuccin";
  };
}

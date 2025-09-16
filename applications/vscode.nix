{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-vscode.live-server
        ms-vsliveshare.vsliveshare
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        esbenp.prettier-vscode
        jnoortheen.nix-ide
      ];

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "files.autoSave" = "afterDelay";
        "git.autofetch" = true;
        "git.enableSmartCommit" = true

        # Prettier settings
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;

        # Nix settings
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
    mutableExtensionsDir = false;
  };
}

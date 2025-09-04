{ ... }:
{

  imports = [
    ./firefox.nix
    ./git.nix
    ./vscode.nix
    ./programming.nix
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main.include = "~/.nixconf/themes/catppuccin-mocha-blue.ini";
    };
  };
}

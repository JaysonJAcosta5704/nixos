{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main.include = "~/.nixconf/themes/catppuccin-mocha-blue.ini";
    };
  };
}

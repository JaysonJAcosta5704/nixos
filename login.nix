{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -- ${config.programs.regreet.package}/bin/regreet";
        user = "greeter";
      };
    };
  };

  programs.regreet = {
    enable = true;
    settings = {
      default_session = "sway";
      background = {
        path = "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png";
        fit = "Cover";
      };

      theme = {
        name = "Adwaita-dark";
      };

      font = {
        name = "sans-serif";
        size = 16;
      };

      corner_radius = 8;
      window_opacity = 0.9;
    };
  };
}

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  pkgs,
  ...
}:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ./boot.nix
    ./login.nix
    ./users.nix
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
    sway
  ];

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  services.libinput.enable = true;

  programs.zsh.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;
  fonts.fontconfig.enable = true;

  system.stateVersion = "25.05";
}

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.device = "nodev";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;
  
  networking.hostName = "Jayson-Thinkpad-T460";
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    secretsFile = "/etc/nixos/secrets/wifi.env";
    networks."CenturyLink6939".pskRaw = "ext:PSK_RAW_1";
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;
  services.libinput.enable = true;

  users.users.Jayson = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.zsh.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;
  home-manager.users.Jayson = import ./home/Jayson.nix;

  environment.systemPackages = with pkgs; [
    pkgs.pulseaudio
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "Jayson";
      };
    };
  };

  system.stateVersion = "25.05";
}

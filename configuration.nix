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
    <home-manager/nixos>
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.device = "nodev";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  services.libinput.enable = true;

  users.users.Jayson = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "storage"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.zsh.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;
  home-manager.users.Jayson = import ./home/Jayson.nix;

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

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "Jayson";
      };
    };
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  system.stateVersion = "25.05";
}

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
    sway
  ];

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        extraEntries = ''
          menuentry "Shutdown" { halt }
          menuentry "Reboot" { reboot }
          menuentry "Enter BIOS" { fwsetup }
          menuentry "Rescue Shell" {
            linux /boot/bzImage
            initrd /boot/initrd
            boot
          }
'';
      };
      efi.efiSysMountPoint = "/boot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth = {
      enable = true;
      theme = "spinner";
      themePackages = with pkgs; [ adi1090x-plymouth-themes ];
    };
  };

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

  users.users.greeter = {
    isSystemUser = true;
    description = "Greeter user for ReGreet";
    home = "/var/lib/greeter";
    createHome = true;
    shell = pkgs.zsh;
    group = "greeter";
  };

  programs.zsh.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

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

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  system.stateVersion = "25.05";
}

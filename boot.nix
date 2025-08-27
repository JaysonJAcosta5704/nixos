{ pkgs, ... }:
{
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
      theme = "hexagon_hud";
      themePackages = with pkgs; [ adi1090x-plymouth-themes ];
    };
  };

}

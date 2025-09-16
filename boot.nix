{ pkgs, ... }:
{
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        configurationLimit = 5;
        extraEntries = ''
          submenu "System - All options {
            menuentry "Shutdown" { halt }
            menuentry "Reboot" { reboot }
            menuentry "Enter BIOS" { fwsetup }
            menuentry "Rescue Shell" {
              linux /boot/bzImage
              initrd /boot/initrd
              boot
            }
          }
          menuentry "Ventoy USB" {
              insmod part_gpt
              insmod part_msdos
              
              if search --no-floppy --set=root --label "VTOYEFI"; then
                   echo "Ventoy drive found with label VTOYEFI"
                  chainloader /EFI/BOOT/BOOTX64.EFI
                  boot
              elif search --no-floppy --set=root --label "VentoyEFI"; then
                  echo "Ventoy drive found with label VentoyEFI"
                  chainloader /EFI/BOOT/BOOTX64.EFI
                  boot
              elif search --no-floppy --set=root --label "Ventoy"; then
                  echo "Ventoy drive found with label Ventoy"
                  chainloader /EFI/BOOT/BOOTX64.EFI
                  boot
              else
                  echo "Ventoy drive not found"
                  echo "Insert ventoy drive before grub loads"
                  sleep 3
                  reboot
              fi
              
          }
          menuentry "MacOS (OpenCore)"{
            chainloader /EFI/OC/OpenCore.efi
          }
          menuentry "FreeBSD"{
            search --file --set=root /boot/loader.efi
            chainloader /boot/loader.efi
          }
        '';
      };
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth = {
      enable = true;
      theme = "hexagon_hud";
      themePackages = with pkgs; [ adi1090x-plymouth-themes ];
    };
  };

}

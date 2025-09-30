{ pkgs, ... }:
{
  boot = {
    loader = {
      grub = {
        enable = true;
        enableCryptodisk = true;
        configurationLimit = 5;
        device = "nodev";
        efiSupport = true;
        extraEntries = ''
          submenu "System - All options" --class submenu {
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
        '';
        useOSProber = true;
        timeout = 30;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
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

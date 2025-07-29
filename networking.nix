{
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.hostName = "Jayson-Thinkpad-T460";
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    secretsFile = "/etc/nixos/secrets/wifi.env";
    networks."CenturyLink6939".pskRaw = "ext:PSK_RAW_1";
  };
}

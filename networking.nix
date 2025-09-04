{ ... }:

let
  wifiPasswords = import ./secrets/WifiSecrets.nix;
  ssidList = builtins.attrNames wifiPasswords;

  wifiNetworkAttrs = builtins.listToAttrs (
    map (
      ssid:
      let
        entry = wifiPasswords.${ssid};
      in
      {
        name = ssid;
        value = if builtins.isString entry then { psk = entry; } else entry;
      }
    ) ssidList
  );
in
{
  networking = {
    hostName = "Thinkpad-Linux";
    useDHCP = false;
    networkmanager.enable = false;
    wireless = {
      enable = true;
      userControlled.enable = true;
      networks = wifiNetworkAttrs;
    };
    interfaces.wlp61s0.useDHCP = true;
    dhcpcd = {
      enable = true;
      extraConfig = ''
        nohook resolve.conf
        noipv411
        timeout 60
        interface wlp61s0
        metric 3003
      '';
    };
  };
}

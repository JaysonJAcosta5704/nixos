{ ... }:

let
  wifiPasswords = import ./secrets/WifiSecrets.nix;
  ssidList = builtins.attrNames wifiPasswords;

  wifiNetworkAttrs = builtins.listToAttrs (
    map (ssid:
      let
        entry = wifiPasswords.${ssid};
      in {
        name = ssid;
        value = if builtins.isString entry then { psk = entry; } else entry;
      }
    ) ssidList
  );
in {
  networking = {
    hostName = "Jayson-Thinkpad-T480s";
    wireless = {
      enable = true;
      userControlled.enable = true;
      networks = wifiNetworkAttrs;
    };
  };
}

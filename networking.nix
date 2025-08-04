{
  ...
}:
let 
  wifiPasswords = import ./secrets/WifiSecrets.nix;
  ssidList = builtins.attrNames wifiPasswords;
  wifiNetworkAttrs = builtins.listToAttrs (
    map (ssid: {
      name = ssid;
      value = { psk = wifiPasswords.${ssid}; };
    }) ssidList
  );
in {
  networking.hostName = "Jayson-Thinkpad-T460";
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = wifiNetworkAttrs;
  };
}

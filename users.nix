{ pkgs, ... }:
{
  users.users = {
    greeter = {
      isSystemUser = true;
      description = "Greeter user for ReGreet";
      home = "/var/lib/greeter";
      createHome = true;
      shell = pkgs.zsh;
      group = "greeter";
    };
    Jayson = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "video"
        "storage"
        "docker"
      ];
      packages = with pkgs; [ tree ];
    };
  };

  home-manager.users.Jayson = import ./home/Jayson.nix;
}

{
  ...
}:
{
  programs.git = {
    enable = true;

    ignores = [
      ".env"
    ];
    extraConfig.init.defaultBranch = "main";

    userEmail = "JaysonJAcosta5704.coding@gmail.com";
    userName = "Jayson Acosa";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}

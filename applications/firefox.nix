{ ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisablePasswordReveal = true;
      PasswordManagerEnabled = false;
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      PopupBlocking = {
        Default = true;
        Locked = true;
      };

      ExtensionSettings = {
        "*" = {
          # blocked_install_message = "Go to ~/.nixconf/home/firefox.nix to install extensions";
          installation_mode = "forced_installed";
          private_browsing = true;
        };

        "{2cd663bd-b2e8-4d88-9518-5365ee453dd4}" = {
          installation_mode = "forced_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4515838/purple_gloomy_clouds-1.0.xpi";
        };

        "uBlock0@raymondhill.net" = {
          default_area = "navbar";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        # Bitwarden - Password Manager
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          default_area = "navbar";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };

        # ClearURLs - Remove tracking parameters
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };

        # React Developer Tools (your request)
        "@react-devtools" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/react-devtools/latest.xpi";
        };

        # Next.js Explorer - Next.js Developer Tools (your request)
        "{nextjs-explorer@addon}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nextjs/latest.xpi";
        };

        # SponsorBlock - Skip YouTube sponsorships
        "sponsorBlocker@ajay.app" = {
          installation_mode = "allowed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
      };
    };
  };
}

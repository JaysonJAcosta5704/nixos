{ config, ... }:
{
  home.sessionVariables = {
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.config/data";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.config/cache";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.config/state";
    
    # Force applications to use .config paths
    HISTFILE = "${config.home.homeDirectory}/.config/shell/history";
    LESSHISTFILE = "${config.home.homeDirectory}/.config/less/history";
    WGETRC = "${config.home.homeDirectory}/.config/wget/wgetrc";
    GNUPGHOME = "${config.home.homeDirectory}/.config/gnupg";
  };

}
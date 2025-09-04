# NixOS Configuration

A modular, well-organized NixOS configuration featuring Sway window manager with a modern, clean aesthetic using the Catppuccin color scheme. This configuration emphasizes modularity, maintainability, and a productive development environment.

## Overview

This configuration provides a complete desktop environment built around:
- **Sway** - Wayland compositor/window manager
- **Waybar** - Modern status bar with system monitoring
- **Catppuccin Mocha** - Consistent theming across all applications
- **Home Manager** - Declarative user environment management
- **ReGreet** - Clean login manager

The setup is designed to be comfortable for daily use and programming tasks, with careful attention to keyboard shortcuts, clipboard management, and development tools.

## System Architecture

### Core Structure
```
├── configuration.nix          # Main system configuration
├── boot.nix                  # Bootloader and kernel settings
├── login.nix                 # Display manager (ReGreet)
├── networking.nix            # Network configuration with WiFi
├── users.nix                 # User accounts and Home Manager integration
├── home/                     # User-specific configurations
│   ├── Jayson.nix           # Main Home Manager config
│   ├── sway.nix             # Window manager configuration
│   ├── waybar.nix           # Status bar configuration
│   ├── terminal.nix         # Alacritty and Zsh setup
│   ├── vscode.nix           # Development environment
│   ├── gitconfig.nix        # Git configuration
│   └── applications.nix     # Application-specific settings
├── themes/                   # Theme configurations
└── secrets/                  # WiFi passwords and sensitive data

```

### Design Philosophy
- **Modular**: Each component is separated into its own file for easy maintenance
- **Declarative**: Everything is version controlled and reproducible
- **User-focused**: Optimized for development and daily productivity
- **Clean**: Minimal, distraction-free interface with consistent theming

## Installation

### Prerequisites
- NixOS system
- Home Manager from nix-community

```bash
# Add Home Manager channel
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
sudo nix-channel --update
```

### Setup Process
*Note: A complete installation script is planned for `scripts/installation/`*

1. Clone this repository to `/etc/nixos/`
2. Update personal information in configuration files
3. Create WiFi password file at `secrets/WifiSecrets.nix`
4. Run `sudo nixos-rebuild switch` to apply system configuration
5. Run `home-manager switch` to apply user configuration

### WiFi Configuration
Create `secrets/WifiSecrets.nix` with your network credentials:
```nix
{
  "YourNetworkName" = "your_password_here";
  "AnotherNetwork" = "another_password";
}
```

## Resources
### Nixos Development
- [Configuration.nix Man Page](https://www.mankier.com/5/configuration.nix)
- [Home Manager Configuration Options](https://nix-community.github.io/home-manager/options.xhtml)
- [Nix Language Manual](https://nix.dev/manual/nix/2.28/language/)

### Configuration Specific
- [Keybindings](./docs/shortcuts.md)
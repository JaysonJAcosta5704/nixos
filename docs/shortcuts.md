# Keyboard Shortcuts

This document contains all keyboard shortcuts configured in the Sway window manager setup.

## Applications

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Open terminal (Alacritty) |
| `Super + d` | Open application launcher (Fuzzel) |
| `Super + Shift + Return` | Open Firefox |
| `Alt + Shift + Return` | Open file manager (Dolphin) |
| `Alt + Shift + v` | Open VSCode |
| `XF86Tools` | Open system monitor (btop) |

## Window Management

| Shortcut | Action |
|----------|--------|
| `Super + Shift + q` | Close focused window |
| `Super + f` | Toggle fullscreen |
| `Super + Shift + Space` | Toggle floating window |
| `Super + Space` | Focus between tiling/floating |
| `Super + h/j/k/l` | Focus left/down/up/right |
| `Super + Shift + h/j/k/l` | Move window left/down/up/right |
| `Super + r` | Resize mode |

## Workspaces

| Shortcut | Action |
|----------|--------|
| `Super + 1-9` | Switch to workspace 1-9 |
| `Super + Shift + 1-9` | Move window to workspace 1-9 |
| `Super + Shift + minus` | Move to scratchpad |
| `Super + minus` | Show scratchpad |

## Layout

| Shortcut | Action |
|----------|--------|
| `Super + b` | Split horizontal |
| `Super + v` | Split vertical |
| `Super + s` | Layout stacking |
| `Super + w` | Layout tabbed |
| `Super + e` | Layout split |

## Screenshots & Clipboard

| Shortcut | Action |
|----------|--------|
| `Super + Shift + s` | Screenshot selection to file |
| `Super + Shift + a` | Screenshot selection to clipboard |
| `Super + Shift + v` | Open clipboard history |

## System Controls

| Shortcut | Action |
|----------|--------|
| `XF86AudioRaiseVolume` | Volume up (+5%) |
| `XF86AudioLowerVolume` | Volume down (-5%) |
| `XF86AudioMute` | Toggle mute |
| `XF86MonBrightnessUp` | Brightness up (+10%) |
| `XF86MonBrightnessDown` | Brightness down (-10%) |

## Sway Controls

| Shortcut | Action |
|----------|--------|
| `Super + Shift + c` | Reload configuration |
| `Super + Shift + e` | Exit Sway |

## Notes

- **Super** key refers to the Windows/Cmd key
- Screenshots are saved to `~/Pictures/Screenshots/` with timestamp filename
- Clipboard history requires `cliphist` service to be running
- Volume and brightness controls work with function keys on most laptops
- All shortcuts can be customized in `home/sway.nix`
# nixos-config

My personal NixOS configuration with Home Manager.

## Overview

TODO

## Structure

```
.
├── flake.nix                           # Flake configuration with inputs and outputs
├── flake.lock                          # Locked flake dependencies
├── hosts/                              # Host-specific configurations
│   └── thinkpad-t480/
│       ├── configuration.nix           # Main system configuration for thinkpad-t480
│       └── hardware-configuration.nix  # Hardware-specific settings for thinkpad-t480
│       
├── modules/                            # Reusable configuration modules
│   ├── system/                         # System-level modules
│   │   └── ...
│   └── user/                           # User-level modules
│       ├── assets/                     # User visual assets (css, wallpapers, etc.)
│       │   └── ...
│       └── ...
│       
└── users/                              # User-specific configurations
    └── julien/
        └── home.nix                    # Home Manager configuration for user 'julien'
```

## Installation

TODO

## Usage

Change to the project directory first:
```bash
cd ~/.dotfiles

```

### Updating the system
```bash
sudo nixos-rebuild switch --flake .
```

### Updating Home Manager configuration
```bash
home-manager switch --flake .
```

### Updating flake inputs
```bash
nix flake update
```

## Customizing Powerlevel10k

The Powerlevel10k configuration is managed through Home Manager but requires special handling since it's not 100% declarative.

### Current configuration
The p10k config is stored in `modules/user/terminal/p10k-config/p10k.zsh` and automatically deployed through the zsh plugin system.

### Making changes

#### Option 1: Edit directly (recommended for small changes)
1. Edit the configuration file:
   ```bash
   nano ~/.dotfiles/modules/user/terminal/p10k-config/p10k.zsh
   ```

2. Apply changes:
   ```bash
   home-manager switch --flake .
   ```

#### Option 2: Use the configuration wizard (for major changes)
1. Run the interactive wizard:
   ```bash
   p10k configure
   ```

2. Go through the configuration process

3. Copy the generated config back to your dotfiles:
   ```bash
   cp ~/.p10k.zsh ~/.dotfiles/modules/user/terminal/p10k-config/p10k.zsh
   ```

4. Apply the changes:
   ```bash
   home-manager switch --flake .
   ```

### Important notes
- Always edit the file in your dotfiles directory, not `~/.p10k.zsh`
- The wizard creates `~/.p10k.zsh`, but Home Manager manages the actual config through the plugin system


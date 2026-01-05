# nixos-config

My personal NixOS configuration with Home Manager.

## Overview

TODO

## Structure

```bash
.
├── flake.nix             # Main entry point for NixOS configurations, defining the different outputs of the flake
├── hosts/                # Contains hardware-specific configurations for each computer
│   ├── system76/         # Configuration for my system76 work computer
│   └── thinkpad-t480/    # Configuration for my ThinkPad T480 personal laptop
├── modules/              # Holds shared configuration modules
│   ├── system/           # System-wide modules
│   └── user/             # User-specific modules
├── users/                # Contains user-specific configurations
│   ├── julien/           # Personal user configuration
│   └── julien-wrk/       # Work user configuration
└── ... (other files and directories)
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


# nixos-config

My personal NixOS configuration with Home Manager.

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

## Generic Linux config 

Here are the steps to use nix and home-manager to configure dotfiles and shell environment on non-NixOS systems (like for my work Ubuntu system):

### Install Nix and enable flakes:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Clone the repository
```bash
git clone git@github.com:JulOuellet/nixos-config.git ~/nix-config
```

> [!NOTE]
> Since we let home-manager manage the git config, in most cases we will need to:
> 1. Install git via the system package manager
> 2. Clone the repository using https since ssh is most likely not configured
> 3. Delete git via the system package manager
> 4. Proceed with the installation
>
> Example:
> ```bash
> sudo apt install git
> git clone https://github.com/JulOuellet/nixos-config.git
> sudo apt remove git
> ```

### Apply the home-manager configuration
```bash
cd ~/nix-config
nix run github:nix-community/home-manager/release-25.11 -- switch --flake .#julien-ubuntu
home-manager switch --flake .#julien-ubuntu
```

### Tell the terminal to use zsh
```bash
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

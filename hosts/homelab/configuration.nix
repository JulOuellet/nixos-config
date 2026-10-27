{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    # Bootloader, firmware and root filesystem for the Pi, plus the sdImage build output
    "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
    # Strips docs, man pages and other extras
    "${modulesPath}/profiles/minimal.nix"
    ../../modules/system/tailscale.nix
  ];

  # sd-image-aarch64.nix pulls in the installer's rescue tools and ZFS support, which a server doesn't need
  disabledModules = ["${modulesPath}/profiles/base.nix"];
  boot.supportedFilesystems = lib.mkForce ["ext4" "vfat"];

  networking.hostName = "homelab";
  time.timeZone = "America/New_York";

  users.users.julien = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIahHWVWhP7FtMyqtJKjBMBFAceKh9gh0O784IFpkJMq"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Lets nixos-rebuild deploy from the laptop without a password prompt
  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = ["julien"];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Keep the store from filling up the SD card
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.nano.enable = false;

  # Don't change this after the first install
  system.stateVersion = "26.05";
}

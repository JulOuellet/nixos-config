{
  config,
  pkgs,
  ...
}: {
  # I use zsh btw
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Needed this line, otherwise hyprland crashed when trying to launch
  hardware.graphics.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Enables support for wlroots compositor
  };

  # Enable docker
  virtualisation.docker.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

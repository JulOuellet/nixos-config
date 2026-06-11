{
  config,
  pkgs,
  ...
}: {
  home.username = "julien";
  home.homeDirectory = "/home/julien";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    pulumi
    gh
  ];

  fonts.fontconfig.enable = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.zsh = {
    initExtra = ''
      eval "$(${pkgs.mise}/bin/mise activate zsh)"

      # SDKMAN! initialization
      export SDKMAN_DIR="$HOME/.sdkman"
      [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    '';

    shellAliases = {
      vpn-status = "openvpn3 sessions-list";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;

  imports = [
    ../../modules/user/git.nix
    ../../modules/user/terminal/zsh.nix
    ../../modules/user/neovim.nix
    ../../modules/user/btop.nix
  ];
}

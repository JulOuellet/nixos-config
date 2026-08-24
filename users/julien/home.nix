{
  config,
  pkgs,
  claude-code,
  opencode,
  system,
  herdr,
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
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    tree
    postman
    dbeaver-bin
    firefox
    pi-coding-agent
    claude-code.packages.${system}.default
    opencode.packages.${system}.default
    herdr.packages.${system}.default
  ];

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ../../modules/user/git.nix
    ../../modules/user/gh.nix
    ../../modules/user/hyprland.nix
    ../../modules/user/neovim.nix
    ../../modules/user/direnv.nix
    ../../modules/user/npm.nix
    ../../modules/user/zk.nix
    ../../modules/user/btop.nix
    ../../modules/user/mako.nix
    ../../modules/user/catppuccin.nix
    ../../modules/user/awscli.nix
  ];
}

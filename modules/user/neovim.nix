{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # neovim package dependancies
      ripgrep
      gcc
      nodejs

      # lsp packages
      lua-language-server
      nixd
      vscode-langservers-extracted
    ];
  };

  # For faster development of nvim config, ~/.config/nvim is a symlink to ~/.nvim/nvim-config
  # This was not done declaratively :(

  # Once I will be happy with my nvim config, we can declare it via a flake input:
  # home.file.".config/nvim".source = inputs.nvim-config;
  # This will be fully declarative again :)
}

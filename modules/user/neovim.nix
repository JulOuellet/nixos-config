{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # neovim plugins dependencies
      ripgrep
      gcc
      nodejs
      go
      fd

      # lsp packages
      lua-language-server
      nixd
      vscode-langservers-extracted # json, css, html
      bash-language-server
      gopls
      sqls
      templ
      pyright
      jdt-language-server

      # formatter packages
      gofumpt
      gotools
      alejandra
      stylua
      nodePackages.prettier
      pgformatter
      jq
      shfmt
      ruff
    ];
  };

  # For faster development of nvim config, ~/.config/nvim is a symlink to ~/.nvim/nvim-config
  # This was not done declaratively :(

  # Once I will be happy with my nvim config, we can declare it via a flake input:
  # home.file.".config/nvim".source = inputs.nvim-config;
  # This will be fully declarative again :)
}

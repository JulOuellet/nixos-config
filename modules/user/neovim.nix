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
      nodePackages.typescript-language-server

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

      (tree-sitter.withPlugins (p: [
        p.tree-sitter-lua
        p.tree-sitter-nix
        p.tree-sitter-css
        p.tree-sitter-html
        p.tree-sitter-json
        p.tree-sitter-go
        p.tree-sitter-templ
        p.tree-sitter-sql
        p.tree-sitter-python
        p.tree-sitter-java
        p.tree-sitter-javascript
        p.tree-sitter-typescript
        p.tree-sitter-bash
        p.tree-sitter-markdown
        p.tree-sitter-markdown-inline
        p.tree-sitter-latex
        p.tree-sitter-typst
        p.tree-sitter-yaml
      ]))
    ];
  };

  # For faster development of nvim config, ~/.config/nvim is a symlink to ~/.nvim/nvim-config
  # This was not done declaratively :(

  # Once I will be happy with my nvim config, we can declare it via a flake input:
  # home.file.".config/nvim".source = inputs.nvim-config;
  # This will be fully declarative again :)
}

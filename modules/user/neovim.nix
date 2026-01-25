{
  config,
  pkgs,
  nvim-config,
  system,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = nvim-config.packages.${system}.deps;
  };

  xdg.configFile."nvim".source = nvim-config;
}

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

  xdg.configFile."nvim".source =
    if config.home.username == "julien"
    then config.lib.file.mkOutOfStoreSymlink "/home/julien/.nvim/nvim-config"
    else nvim-config;
}

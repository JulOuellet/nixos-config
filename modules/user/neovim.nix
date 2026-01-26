{
  config,
  pkgs,
  nvim-config,
  system,
  ...
}: let
  localConfigPath = "/home/julien/.nvim/nvim-config";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = nvim-config.packages.${system}.deps;
  };

  xdg.configFile."nvim".source =
    if builtins.pathExists localConfigPath
    then config.lib.file.mkOutOfStoreSymlink localConfigPath
    else nvim-config;
}

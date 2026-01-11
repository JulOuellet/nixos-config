{
  config,
  pkgs,
  walker,
  ...
}: {
  imports = [
    walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;

    # Optional: Basic config to get you started
    config = {
      search.placeholder = "Search...";
      ui.width = 400;
      app_launch_prefix = "exec";
    };
  };
}

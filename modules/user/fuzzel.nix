{
  config,
  pkgs,
  ...
}: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        width = 50;
        horizontal-pad = 20;
        vertical-pad = 20;
        prompt = "Run: ";
      };
    };
  };
}

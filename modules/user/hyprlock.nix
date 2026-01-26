{
  config,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "${./assets/marine-tunnel.jpg}";
          blur_passes = 2;
          blur_size = 4;
        }
      ];
    };
  };
}

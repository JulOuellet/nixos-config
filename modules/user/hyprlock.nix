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
          path = "${./assets/wallpaper.png}";
          blur_passes = 2;
          blur_size = 4;
        }
      ];

      input-field = [
        {
          size = "250, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;

          # Everforest Colors
          font_color = "rgb(211, 198, 170)"; # fg (Warm White)
          inner_color = "rgb(43, 51, 57)"; # bg_dim (Dark Green/Grey)
          outer_color = "rgb(167, 192, 128)"; # green (Accent)
          check_color = "rgb(219, 188, 127)"; # yellow
          fail_color = "rgb(230, 126, 128)"; # red

          outline_thickness = 3;
          placeholder_text = "<i>Password...</i>";

          # Shadow removed
          shadow_passes = 0;
        }
      ];

      label = [
        {
          text = "$TIME";
          color = "rgb(202, 211, 245)";
          font_size = 64;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}

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

          # Shape & Border
          rounding = 0;
          outline_thickness = 0;

          # Colors (Everforest Dark)
          font_color = "rgb(211, 198, 170)";
          inner_color = "rgb(43, 51, 57)";
          check_color = "rgb(167, 192, 128)";
          fail_color = "rgb(230, 126, 128)";

          placeholder_text = "Type password";

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

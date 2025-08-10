{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bind =
        [
          # Open and close programs
          "$mod, RETURN, exec, kitty"
          "$mod, W, exec, firefox"
          "$mod, D, exec, fuzzel"
          "$mod, Q, killactive"

          # Change focus
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"
          "$mod, LEFT, movefocus, l"
          "$mod, RIGHT, movefocus, r"
          "$mod, UP, movefocus, u"
          "$mod, DOWN, movefocus, d"

          # Swap windows
          "$mod SHIFT, H, swapwindow, l"
          "$mod SHIFT, L, swapwindow, r"
          "$mod SHIFT, K, swapwindow, u"
          "$mod SHIFT, J, swapwindow, d"
          "$mod SHIFT, LEFT, swapwindow, l"
          "$mod SHIFT, RIGHT, swapwindow, r"
          "$mod SHIFT, UP, swapwindow, u"
          "$mod SHIFT, DOWN, swapwindow, d"

          # Brightness
          ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

          # Volume
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioMute, exec, pamixer -t"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
      };

      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.7;
        rounding = 8;
      };

      exec-once = "waybar";
    };
  };
}

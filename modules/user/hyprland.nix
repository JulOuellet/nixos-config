{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./stylix.nix
    ./waybar.nix
    ./fuzzel.nix
    ./terminal/kitty.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    pamixer
    firefox
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      input = {
        kb_layout = "us,ca";
        kb_variant = ",fr";
        kb_options = "grp:win_space_toggle";
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

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

          # Toggle floating windows
          "$mod, F, togglefloating"

          # Brightness
          ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

          # Volume
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioMute, exec, pamixer -t"

          # Screenshot
          ", F12, exec, hyprshot -m region --clipboard"
          "SHIFT, F12, exec, hyprshot -m window --clipboard"
          "CONTROL, F12, exec, hyprshot -m output --clipboard"
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

      monitor = [
        "eDP-1,1920x1080@60,4480x0,1.2"
        "DP-1,2560x1440@144,1920x0,1"
        "HDMI-A-2,1920x1080@60,0x0,1"
      ];

      exec-once = [
        #"hypridle"
        "hyprlock"
        "waybar"
      ];
    };

    extraConfig = ''
      # window resize
      bind = $mod, S, submap, resize

      submap = resize
      binde = , right, resizeactive, 10 0
      binde = , left, resizeactive, -10 0
      binde = , up, resizeactive, 0 -10
      binde = , down, resizeactive, 0 10
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}

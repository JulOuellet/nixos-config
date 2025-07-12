{ config, pkgs, ... }:  

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, Q, killactive"

        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
      exec-once = "waybar";
    };
  };
}

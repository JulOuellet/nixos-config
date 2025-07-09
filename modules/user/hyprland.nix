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
      ];
    };
  };
}

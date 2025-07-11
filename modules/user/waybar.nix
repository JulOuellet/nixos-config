{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "battery" ];

      clock = {
        format = "{:%H:%M:%S}";
      };

      battery = {
        format = "{capacity}%";
      };
    }];
  };
}

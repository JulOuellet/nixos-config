{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      margin = "10 10 0 10";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "battery" ];

      battery = {
	format = "{capacity}% {icon}";
	format-charging = "{capacity}% ";
	format-icons = [ "" "" "" "" "" ];
      };

      clock = {
	format = "{:%H:%M:%S}";
      };

    }];

    style = builtins.readFile ./assets/style.css;
  };
}

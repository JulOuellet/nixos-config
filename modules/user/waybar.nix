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
      modules-right = [ "pulseaudio" "pulseaudio/slider" "battery" ];

      battery = {
	interval = 10; # Battery state polling period (seconds)

	format = "{capacity}% {icon}";
	format-charging = "{capacity}%  {time}";
	format-icons = [ "" "" "" "" "" ];

	states = {
	  warning = 20;
	  critical = 10;
	};
      };

      pulseaudio = {
	format = "{icon}";
	format-muted = "";
	format-icons = {
	  default = [ "" "" "" ];
	};

	tooltip = true;
	tooltip-format = "Volume: {volume}%";
      };

      pulseaudio-slider = {
	max = 0;
	min = 100;
	orientation = "orizontal";
      };

      clock = {
	format = "{:%H:%M:%S}";
      };

    }];

    style = builtins.readFile ./assets/style.css;
  };
}

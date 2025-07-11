{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "workspaces" "clock" ];
      modules-right = [ "pulseaudio" ];
    }];
  };
}

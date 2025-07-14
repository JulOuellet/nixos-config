{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [];
      modules-right = [ "memory" "cpu" "temperature" "battery" "clock" ];

      memory = {
        format = "RAM: {percentage}%";
      };

      cpu = {
        format = "CPU: {usage}%";
      };

      temperature = {
        hwmon-path = "/sys/class/thermal/thermal_zone0/temp";
        critical-threshold = 80;
        format = "Temp: {temperatureC}°C";
      };

      battery = {
        format = "Battery: {capacity}%";
        format-charging = "Battery: {capacity}% (charging)";
      };

      clock = {
        format = "{:%H:%M:%S}";
      };

    }];
  };
}

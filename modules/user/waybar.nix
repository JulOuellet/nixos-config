{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        margin = "0 0 0 0";

        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "pulseaudio/slider"
          "battery"
        ];

        battery = {
          interval = 10;

          format = "{capacity}% {icon}";
          format-charging = "{capacity}%  {time}";
          format-icons = ["" "" "" "" ""];

          states = {
            warning = 20;
            critical = 10;
          };
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
          };

          tooltip = true;
          tooltip-format = "Volume: {volume}%";
        };

        pulseaudio-slider = {
          max = 0;
          min = 100;
          orientation = "horizontal";
        };

        clock = {
          interval = 1;
          format = "{:%A %H:%M:%S}";
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        "hyprland/language" = {
          format = "⌨ {}";
          format-en = "en";
          format-fr = "fr";
          tooltip-format = "Keyboard: {}";
        };
      }
    ];

    style = builtins.readFile ./assets/style.css;
  };
}

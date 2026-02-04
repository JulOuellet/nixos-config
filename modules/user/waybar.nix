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
          "network"
          "pulseaudio"
          "pulseaudio/slider"
          "battery"
        ];

        battery = {
          interval = 10;

          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
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

          # on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
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

        network = {
          interval = 3;

          format-wifi = "{icon} {signalStrength}%";
          format-ethernet = "󰈀";
          format-disconnected = "󰤮";

          format-icons = [
            "󰤯" # 0-20%
            "󰤟" # 21-40%
            "󰤢" # 41-60%
            "󰤥" # 61-80%
            "󰤨" # 81-100%
          ];

          # Detailed Tooltips
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-wifi = "󰤨  {essid} ({signalStrength}%)\n󰩟 {ipaddr}/{cidr}\n󱂇 {gwaddr}";
          tooltip-format-ethernet = "󰈀 {ifname}\n󰩟 {ipaddr}/{cidr}";
          tooltip-format-disconnected = "󰤮  Disconnected";

          # on-click = "nm-connection-editor";
        };
      }
    ];

    style = builtins.readFile ./assets/style.css;
  };
}

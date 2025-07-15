{  config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "Hack Nerd Font";
      font_size = "12.0";

      # Everforest-inspired colors
      foreground = "#D3C6AA";
      background = "#2B3339";

      cursor = "#A7C080";

      color0  = "#4B565C";
      color1  = "#E67E80";
      color2  = "#A7C080";
      color3  = "#DBBC7F";
      color4  = "#7FBBB3";
      color5  = "#D699B6";
      color6  = "#83C092";
      color7  = "#D3C6AA";

      color8  = "#4B565C";
      color9  = "#E67E80";
      color10 = "#A7C080";
      color11 = "#DBBC7F";
      color12 = "#7FBBB3";
      color13 = "#D699B6";
      color14 = "#83C092";
      color15 = "#D3C6AA";
    };
  };
}

{  config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "Hack Nerd Font";
      font_size = "12.0";
    };
  };
}

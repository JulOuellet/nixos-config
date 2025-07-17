{ config, pkgs, ... }:

{
  stylix.enable = true;

  # Everforest theme
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.polarity = "dark";

  stylix.targets = {
    kitty.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
    firefox.enable = true;
    neovim.enable = false;  # let neovim configure its own theme
    fuzzel.enable = true;
    gtk.enable = true;
  };
}

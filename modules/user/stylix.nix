{ config, pkgs, ... }:

{
  stylix = {
    enable = true;

    # Everforest theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    polarity = "dark";

    image = ../../assets/wallpaper.png;

    targets = {
      kitty.enable = true;
      waybar.enable = true;
      hyprland.enable = true;
      firefox.enable = true;
      neovim.enable = false;  # let neovim configure its own theme
      fuzzel.enable = true;
      gtk.enable = true;
    };

    fonts.sizes = {
      applications = 10;
      terminal = 10;
      desktop = 10;
      popups = 10;
    };

    opacity = {
      applications = 1.0;
      terminal = 0.85;
      desktop = 1.0;
      popups = 1.0;
    };

  };
}

{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    # Everforest theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    polarity = "dark";

    image = ./assets/wallpaper.png;

    targets = {
      kitty.enable = true;
      waybar.enable = false; # Waybar is customized from its style.css file
      hyprland.enable = true;
      firefox.enable = true;
      neovim.enable = false; # let neovim configure its own theme
      fuzzel.enable = true;
      gtk.enable = true;
    };

    fonts.sizes = {
      applications = 12;
      terminal = 12;
      desktop = 12;
      popups = 12;
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}

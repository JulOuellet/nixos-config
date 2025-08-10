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

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    targets = {
      grub.enable = true;
      plymouth.enable = true;
      console.enable = true;

      gtk.enable = true;
    };
  };
}

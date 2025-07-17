{ config, pkgs, ... }:

{
  stylix.enable = true;
  
  # Everforest theme
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.polarity = "dark";
  
  stylix.fonts = {
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
  
  stylix.fonts.sizes = {
    applications = 12;
    terminal = 14;
    desktop = 11;
    popups = 12;
  };
  
  stylix.opacity = {
    applications = 0.95;
    terminal = 0.9;
    desktop = 1.0;
    popups = 0.95;
  };
  
  stylix.targets = {
    grub.enable = true;
    plymouth.enable = true;
    console.enable = true;
    
    gtk.enable = true;
  };
}

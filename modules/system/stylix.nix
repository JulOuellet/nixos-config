# modules/system/stylix.nix
{ config, pkgs, ... }:

{
  stylix.enable = true;
  
  # Everforest theme
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.polarity = "dark";
  
  # Configure fonts
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
  
  # Font sizes
  stylix.fonts.sizes = {
    applications = 12;
    terminal = 14;
    desktop = 11;
    popups = 12;
  };
  
  # Configure opacity
  stylix.opacity = {
    applications = 0.95;
    terminal = 0.9;
    desktop = 1.0;
    popups = 0.95;
  };
  
  # System-level targets
  stylix.targets = {
    # Boot and system
    grub.enable = true;
    plymouth.enable = true;
    console.enable = true;
    
    # System-wide theming
    gtk.enable = true;
  };
}

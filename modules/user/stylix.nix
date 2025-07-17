# modules/user/stylix.nix
{ config, pkgs, ... }:

{
  stylix.enable = true;
  
  # Use the same theme as system for consistency
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.polarity = "dark";
  
  # Home Manager specific targets for your setup
  stylix.targets = {
    # Your specific applications
    kitty.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
    firefox.enable = true;
    neovim.enable = false;
    fuzzel.enable = true;
    
    # Additional useful targets
    gtk.enable = true;
    
    # Disable any that might interfere or you don't want themed
    # alacritty.enable = false;  # Since you're using kitty
    # rofi.enable = false;       # Since you're using fuzzel
  };
}

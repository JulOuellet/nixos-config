{
  config,
  pkgs,
  catppuccin,
  ...
}: {
  imports = [
    catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";

    nvim.enable = false;
    hyprland.enable = false;
  };
}

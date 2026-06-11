{
  config,
  pkgs,
  ...
}: {
  catppuccin = {
    enable = true;
    flavor = "frappe";

    nvim.enable = false;
    hyprland.enable = false;
  };
}

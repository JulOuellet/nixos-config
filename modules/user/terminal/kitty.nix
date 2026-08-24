{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    package = config.lib.nixGL.wrappers.mesa pkgs.kitty;

    settings = {
      window_padding_width = 5;

      "map ctrl+equal" = "change_font_size all +1.0";
      "map ctrl+minus" = "change_font_size all -1.0";
      "map ctrl+0" = "change_font_size all 0";
    };
  };
}

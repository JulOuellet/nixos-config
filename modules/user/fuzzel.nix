{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Hack Nerd Font:size=11";
        width = 50;
        horizontal-pad = 20;
        vertical-pad = 20;
        prompt = "Run: ";
      };

      colors = {
        background = "282828ee";
        text = "ebdbb2ff";
        match = "fabd2fff";
        selection = "83a598ff";
        selection-text = "282828ff";
      };
    };
  };
}

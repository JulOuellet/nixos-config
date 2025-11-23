{
  config,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = ''
              _   ___       ____  _____
             / | / (_)_  __/ __ \/ ___/
            /  |/ / /| |/_/ / / /\__ \
           / /|  / /_>  </ /_/ /___/ /
          /_/ |_/_//_/|_|\____//____/
        '';
        type = "data";
      };

      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "shell"
        "wm"
        "font"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "localip"
        "break"
      ];
    };
  };
}

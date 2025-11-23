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
        padding = {
          left = 2;
        };
      };

      display = {
        separator = " → ";
      };
      modules = [
        {
          type = "host";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "os";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = " 󱂬";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "cpu";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "gpu";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "disk";
          key = " ";
          keyColor = "blue";
        }
        "break"
      ];
    };
  };
}

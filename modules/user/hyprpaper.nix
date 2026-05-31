{pkgs, ...}: let
  img = toString ./assets/marine-tunnel.jpg;
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    ipc = on
    splash = 0

    wallpaper {
      monitor = eDP-1
      path = ${img}
      fit_mode = cover
    }

    wallpaper {
      monitor = DP-1
      path = ${img}
      fit_mode = cover
    }

    wallpaper {
      monitor = HDMI-A-2
      path = ${img}
      fit_mode = cover
    }
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "hyprpaper";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "always";
      RestartSec = 10;
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}

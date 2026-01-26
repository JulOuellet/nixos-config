{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = ["${./assets/marine-tunnel.jpg}"];
      wallpaper = [",${./assets/marine-tunnel.jpg}"];
    };
  };
}

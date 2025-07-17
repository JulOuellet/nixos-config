{ config, pkgs, ... }:  

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
	"$mod, RETURN, exec, kitty"
	"$mod, W, exec, firefox"
	"$mod, D, exec, fuzzel"

	"$mod, Q, killactive"
	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	# Brightness
	", XF86MonBrightnessUp, exec, brightnessctl set +10%"
	", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

	# Volume
	", XF86AudioRaiseVolume, exec, pamixer -i 5"
	", XF86AudioLowerVolume, exec, pamixer -d 5"
	", XF86AudioMute, exec, pamixer -t"
      ] ++ (
	  builtins.concatLists (builtins.genList (i:
	    let ws = i + 1;
	    in [
	      "$mod, code:1${toString i}, workspace, ${toString ws}"
	      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	    ]
	  ) 9)
	);

      general = {
	gaps_in = 5;
	gaps_out = 10;
      };

      exec-once = "waybar";
    };
  };
}

{zen-browser, ...}: {
  imports = [
    zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;

    policies = {
      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      DisableFirefoxScreenshots = true;
      DisplayBookmarksToolbar = "never";
      DontCheckDefaultBrowser = true;
    };

    profiles.default = {
      pinsForce = true;
      pinsForceAction = "demote";

      pins = {
        "YouTube" = {
          id = "d6ee7c49-815b-4cbf-9a30-eb1948ffb5ea";
          url = "https://www.youtube.com";
          position = 100;
          isEssential = true;
        };
        "GitHub" = {
          id = "f04e13ae-4833-457c-9423-ecc486c5c7d4";
          url = "https://github.com";
          position = 101;
          isEssential = true;
        };
        "Gemini" = {
          id = "3b79550c-e3f6-426e-9c0a-216587df3978";
          url = "https://gemini.google.com";
          position = 102;
          isEssential = true;
        };
        "Claude" = {
          id = "b73c302d-bd39-406d-ba82-8d2f64bfe380";
          url = "https://claude.ai";
          position = 103;
          isEssential = true;
        };
      };
    };
  };
}

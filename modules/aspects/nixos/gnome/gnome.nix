_: {
  caden.gnome = {
    nixos = _: {
      services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;

        gnome = {
          core-developer-tools.enable = false;
          games.enable = false;
        };
      };

      # TODO: Remove once GNOME 50 is in nixpkgs.
      programs.dconf.profiles.user.databases = [
        {
          settings = {
            "org/gnome/mutter" = {
              experimental-features = [
                "scale-monitor-framebuffer" # Fractional scaling
                "xwayland-native-scaling"
              ];
            };
          };
        }
      ];
    };
  };
}

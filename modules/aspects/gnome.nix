{
  caden.gnome = {
    nixos = {
      services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;

        gnome = {
          core-developer-tools.enable = false;
          games.enable = false;
        };
      };

      # Maybe turn these into separate `provides`?
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

    provides.gnome-extensions = {
      homeManager = {
        programs.gnome-shell.enable = true;
      };

      provides.blur-my-shell = {
        homeManager =
          { pkgs, ... }:
          {
            programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
              {
                package = blur-my-shell;
              }
            ];
          };
      };

      provides.caffeine = {
        homeManager =
          { pkgs, ... }:
          {
            programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
              {
                package = caffeine;
              }
            ];
          };
      };

      provides.appindicator = {
        homeManager =
          { pkgs, ... }:
          {
            programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
              {
                package = appindicator;
              }
            ];
          };
      };
    };

    provides.gnome-settings = {
      provides.wallpapers = {
        provides.and-the-circus-leaves-town.homeManager =
          { pkgs, ... }:
          {
            dconf.settings."org/gnome/desktop/background" =
              let
                and-the-circus-leaves-town = pkgs.runCommand "and-the-circus-leaves-town" {
                  src = pkgs.fetchurl {
                    url = "https://coverartarchive.org/release/fafca640-a7f6-49bc-92d1-2d0754662b47/front";
                    hash = "sha256-6LBrAoVAtugrrfwao2nQfMApPVo/HiQBQxLfJchMX+U=";
                    curlOptsList = [ "-L" ];
                  };
                  nativeBuildInputs = [ pkgs.libjpeg_turbo ];
                } "jpegtran -crop 1200x750+0+198 -copy none $src >$out";
              in
              {
                picture-uri = "file://${and-the-circus-leaves-town}";
                picture-uri-dark = "file://${and-the-circus-leaves-town}";
              };
          };
      };

      provides.accent-colour._.purple.homeManager.dconf.settings."org/gnome/desktop/interface".accent-color =
        "purple";
    };
  };
}

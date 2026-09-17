{ caden, ... }: {
  caden.desktops.gnome = {
    includes = [
      caden.desktops.common
    ];

    nixos = { pkgs, ... }: {
      services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;

        gnome = {
          core-apps.enable = true;

          gnome-browser-connector.enable = false;
          gnome-initial-setup.enable = false;
        };
      };

      environment = {
        systemPackages = [
          pkgs.ptyxis
          pkgs.resources
        ];

        gnome.excludePackages = [
          pkgs.epiphany
          pkgs.gnome-contacts
          pkgs.gnome-music
          pkgs.gnome-system-monitor
          pkgs.gnome-terminal
          pkgs.gnome-tour
          pkgs.yelp
        ];
      };
    };
  };
}

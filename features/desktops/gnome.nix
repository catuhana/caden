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
          core-apps.enable = false;

          gnome-browser-connector.enable = false;
          gnome-initial-setup.enable = false;
        };
      };

      environment = {
        systemPackages = [
          pkgs.decibels
          pkgs.gnome-calculator
          pkgs.gnome-calendar
          pkgs.gnome-characters
          pkgs.gnome-tecla
          pkgs.gnome-text-editor
          pkgs.gnome-weather
          pkgs.loupe
          pkgs.nautilus
          pkgs.papers
          pkgs.ptyxis
          pkgs.resources
          pkgs.showtime
        ];

        gnome.excludePackages = [
          pkgs.gnome-disk-utility
          pkgs.gnome-tour
          pkgs.seahorse
        ];
      };
    };
  };
}

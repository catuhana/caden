{ caden, ... }: {
  caden.desktops.gnome = {
    includes = [
      caden.desktops.common
    ];

    nixos = _: {
      services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
      };
    };
  };
}

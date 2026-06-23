_: {
  caden.desktops.gnome = {
    nixos = _: {
      services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
      };
    };
  };
}

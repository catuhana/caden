_: {
  caden.desktops.plasma = {
    nixos = _: {
      services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
      };
    };
  };
}

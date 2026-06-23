{ caden, ... }: {
  caden.desktops.plasma = {
    includes = [
      caden.desktops.common
    ];

    nixos = _: {
      services = {
        desktopManager.plasma6.enable = true;
        displayManager.plasma-login-manager.enable = true;

        samba.enable = true;
      };
    };
  };
}

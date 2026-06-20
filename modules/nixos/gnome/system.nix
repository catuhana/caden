_: {
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;

    gnome = {
      core-developer-tools.enable = false;
      games.enable = false;
    };
  };
}

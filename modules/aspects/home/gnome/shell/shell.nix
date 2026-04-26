_: {
  caden.gnome = {
    provides.shell = {
      homeManager = _: {
        programs.gnome-shell.enable = true;
      };
    };
  };
}

{
  caden,
  ...
}:
{
  caden.gnome = {
    shell = {
      includes = [
        caden.gnome.shell.extensions
        caden.gnome.shell.settings
      ];

      homeManager = _: {
        programs.gnome-shell.enable = true;
      };
    };
  };
}

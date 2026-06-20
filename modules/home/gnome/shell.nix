{ config, lib, ... }:
{
  options.caden.gnome.shell.extensions = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
  };

  config = {
    programs.gnome-shell = {
      enable = true;

      extensions = map (package: {
        inherit package;
      }) config.caden.gnome.shell.extensions;
    };
  };
}

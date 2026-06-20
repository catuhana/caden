{ config, lib, ... }:
{
  options.caden.gnome.shell.settings.appearance.accent-colour = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "blue"
        "teal"
        "green"
        "yellow"
        "orange"
        "red"
        "pink"
        "purple"
        "slate"
      ]
    );
    default = null;
  };

  config.dconf.settings =
    let
      inherit (config.caden.gnome.shell.settings.appearance) accent-colour;
    in
    lib.optionalAttrs (accent-colour != null) {
      "org/gnome/desktop/interface".accent-color = accent-colour;
    };
}

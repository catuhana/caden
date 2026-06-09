{
  caden,
  ...
}:
{
  den.schema = {
    user =
      { lib, ... }:
      {
        options = {
          caden.gnome.shell.settings.appearance = {
            accent-colour = lib.mkOption {
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
          };
        };
      };
  };

  caden.gnome = {
    shell = {
      settings = {
        includes = [ caden.gnome.shell.settings.appearance ];

        appearance =
          { user, ... }:
          {
            homeManager =
              { lib, ... }:
              {
                dconf.settings =
                  let
                    inherit (user.caden.gnome.shell.settings.appearance) accent-colour;
                  in
                  lib.optionalAttrs (accent-colour != null) {
                    "org/gnome/desktop/interface".accent-color = accent-colour;
                  };
              };
          };
      };
    };
  };
}

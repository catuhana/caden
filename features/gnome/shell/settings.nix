{
  caden,
  ...
}:
{
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

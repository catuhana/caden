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
                  {
                    "org/gnome/desktop/interface".accent-color = lib.mkIf (accent-colour != null) accent-colour;
                  };
              };
          };
      };
    };
  };
}

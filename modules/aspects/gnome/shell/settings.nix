{
  __findFile,
  ...
}:
{
  caden.gnome = {
    provides.shell = {
      provides.settings = {
        includes = [
          <caden/gnome/shell/settings/appearance>
        ];

        provides.appearance =
          { user, ... }:
          {
            homeManager =
              { lib, ... }:
              {
                dconf.settings =
                  let
                    accent-colour = user.caden.gnome.shell.settings.appearance.accent-colour;
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

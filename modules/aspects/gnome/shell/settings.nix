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
          { user, lib, ... }:
          {
            homeManager =
              { pkgs, ... }:
              let
                # TODO: Refactor out to a meta-package like `tuhana-wallpapers` or something.
                and-the-circus-leaves-town = pkgs.runCommand "and-the-circus-leaves-town" {
                  src = pkgs.fetchurl {
                    url = "https://coverartarchive.org/release/fafca640-a7f6-49bc-92d1-2d0754662b47/front";
                    hash = "sha256-6LBrAoVAtugrrfwao2nQfMApPVo/HiQBQxLfJchMX+U=";
                    curlOptsList = [ "-L" ];
                  };
                  nativeBuildInputs = [ pkgs.libjpeg_turbo ];
                } "jpegtran -crop 1200x750+0+198 -copy none $src >$out";
              in
              {
                dconf.settings =
                  let
                    accent-colour = user.caden.gnome.shell.settings.appearance.accent-colour;
                  in
                  {
                    "org/gnome/desktop/interface".accent-color = lib.mkIf (accent-colour != null) accent-colour;

                    "org/gnome/desktop/background" = {
                      picture-uri = "file://${and-the-circus-leaves-town}";
                      picture-uri-dark = "file://${and-the-circus-leaves-town}";
                    };
                  };
              };
          };
      };
    };
  };
}

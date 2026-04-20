{
  __findFile,
  ...
}:
{
  caden.gnome = {
    provides.shell = {
      provides.extensions =
        { user, ... }:
        {
          homeManager =
            { pkgs, lib, ... }:
            {
              programs.gnome-shell.extensions =
                lib.optionals user.caden.gnome.shell.extensions.blur-my-shell.enable [
                  { package = pkgs.gnomeExtensions.blur-my-shell; }
                ]
                ++ lib.optionals user.caden.gnome.shell.extensions.caffeine.enable [
                  { package = pkgs.gnomeExtensions.caffeine; }
                ]
                ++ lib.optionals user.caden.gnome.shell.extensions.appindicator.enable [
                  { package = pkgs.gnomeExtensions.appindicator; }
                ]
                ++ lib.optionals user.caden.gnome.shell.extensions.copyous.enable [
                  {
                    package = pkgs.gnomeExtensions.copyous.overrideAttrs (
                      old:
                      let
                        inherit (pkgs)
                          gsound
                          libgda5
                          ;
                      in
                      {
                        buildInputs = [ libgda5 ];

                        preInstall = ''
                          sed -i "1i import GIRepository from 'gi://GIRepository';\nGIRepository.Repository.dup_default().prepend_search_path('${libgda5}/lib/girepository-1.0');\nGIRepository.Repository.dup_default().prepend_search_path('${gsound}/lib/girepository-1.0');\n" lib/preferences/dependencies/dependencies.js
                          sed -i "1i import GIRepository from 'gi://GIRepository';\nGIRepository.Repository.dup_default().prepend_search_path('${libgda5}/lib/girepository-1.0');\n" lib/misc/db.js
                        '';
                      }
                    );
                  }
                ];
            };
        };
    };
  };
}

_: {
  caden.gnome = {
    shell = {
      extensions =
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
                    package = pkgs.gnomeExtensions.copyous;
                  }
                ]
                ++ lib.optionals user.caden.gnome.shell.extensions.tint-my-gnome.enable [
                  {
                    package = pkgs.gnomeExtensions.tint-my-gnome;
                  }
                ];
            };
        };
    };
  };
}

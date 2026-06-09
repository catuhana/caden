_: {
  den.schema = {
    user =
      { lib, ... }:
      {
        options = {
          caden.gnome.shell.extensions = {
            blur-my-shell.enable = lib.mkEnableOption "Blur My Shell GNOME extension";
            caffeine.enable = lib.mkEnableOption "Caffeine GNOME extension";
            appindicator.enable = lib.mkEnableOption "AppIndicator GNOME extension";
            copyous.enable = lib.mkEnableOption "Copyous GNOME extension";
            tint-my-gnome.enable = lib.mkEnableOption "Tint My Gnome GNOME extension";
          };
        };
      };
  };

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

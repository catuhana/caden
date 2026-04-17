_: {
  den.schema = {
    user =
      { lib, ... }:
      {
        options = {
          caden.gnome = {
            shell = {
              extensions = {
                blur-my-shell.enable = lib.mkEnableOption "Blur My Shell GNOME extension";
                caffeine.enable = lib.mkEnableOption "Caffeine GNOME extension";
                appindicator.enable = lib.mkEnableOption "AppIndicator GNOME extension";
                copyous.enable = lib.mkEnableOption "Copyous GNOME extension";
              };

              settings = {
                appearance = {
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
        };
      };
  };
}

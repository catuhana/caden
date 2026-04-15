_: {
  den.schema = {
    user =
      { lib, ... }:
      {
        options = {
          caden.gnome = {
            shell = {
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

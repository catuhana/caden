_: {
  caden.tuhana = {
    gnome = _: {
      homeManager =
        {
          pkgs,
          ...
        }:
        {
          programs.gnome-shell = {
            enable = true;

            extensions = map (package: { inherit package; }) (
              with pkgs.gnomeExtensions;
              [
                blur-my-shell
                caffeine
                appindicator
              ]
            );
          };
        };
    };
  };
}

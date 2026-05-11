_: {
  caden.programs = {
    claude-desktop = {
      homeManager =
        { pkgs, ... }:
        {
          home.packages = [ pkgs.claude-desktop-fhs ];
        };
    };
  };
}

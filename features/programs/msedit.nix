_: {
  caden.programs = {
    msedit = {
      homeManager =
        { pkgs, ... }:
        {
          home = {
            packages = [ pkgs.msedit ];

            sessionVariables = {
              EDITOR = "edit";
              VISUAL = "edit";
            };
          };
        };
    };
  };
}

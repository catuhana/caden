_: {
  caden.programs = {
    provides.msedit = {
      # TODO: Put this under `homeManager`, it's kind of
      # like a user preference.
      nixos =
        { pkgs, ... }:
        {
          environment = {
            systemPackages = [ pkgs.msedit ];

            variables = {
              EDITOR = "edit";
              VISUAL = "edit";
            };
          };
        };
    };
  };
}

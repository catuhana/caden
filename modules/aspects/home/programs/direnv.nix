_: {
  caden.programs = {
    provides.direnv = {
      homeManager = _: {
        programs.direnv = {
          enable = true;

          nix-direnv.enable = true;
        };
      };
    };
  };
}

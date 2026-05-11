_: {
  caden.programs = {
    direnv = {
      homeManager = _: {
        programs.direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
      };
    };
  };
}

_: {
  caden.programs = {
    git = {
      homeManager = _: {
        programs.git.enable = true;
      };

      nixos = _: {
        programs.git.enable = true;
      };
    };
  };
}

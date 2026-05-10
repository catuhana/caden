_: {
  caden.programs = {
    provides.git = {
      homeManager = _: {
        programs.git.enable = true;
      };

      nixos = _: {
        programs.git.enable = true;
      };
    };
  };
}

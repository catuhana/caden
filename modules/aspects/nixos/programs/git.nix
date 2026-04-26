_: {
  caden.programs = {
    provides.git = {
      nixos = _: {
        programs.git.enable = true;
      };
    };
  };
}

_: {
  caden.programs = {
    nh = {
      homeManager = _: {
        programs.nh = {
          enable = true;

          # TODO: Don't hard-code this, set up a schema.
          flake = "/home/tuhana/Documents/Pwogwamming/Pwojects/caden";
        };
      };
    };
  };
}

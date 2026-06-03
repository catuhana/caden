_: {
  caden.programs = {
    gamescope = {
      nixos = _: {
        programs = {
          gamescope.capSysNice = true;

          steam = {
            enable = true;
            gamescopeSession.enable = true;
          };
        };
      };
    };
  };
}

_: {
  caden.programs = {
    gamemode = {
      nixos = _: {
        programs.gamemode = {
          enable = true;
        };
      };

      user = _: {
        extraGroups = [ "gamemode" ];
      };
    };
  };
}

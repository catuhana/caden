_: {
  caden.programs = {
    gamemode = {
      nixos = _: {
        programs.gamemode = {
          enable = true;

          settings = {
            general = {
              desiredgov = "performance";
              igpu_desiredgov = "powersave";
              igpu_power_threshold = 0.3;
              softrealtime = "auto";
              renice = 10;
              ioprio = 0;
              inhibit_screensaver = 1;
              disable_splitlock = 1;
            };
          };
        };
      };
    };
  };
}

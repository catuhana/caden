_: {
  caden.programs = {
    gamescope = {
      nixos =
        { pkgs, ... }:
        {
          boot.kernelModules = [ "ntsync" ];

          programs = {
            gamescope.capSysNice = true;

            steam = {
              enable = true;
              gamescopeSession.enable = true;

              extraCompatPackages = [ pkgs.proton-ge-bin ];

              remotePlay.openFirewall = true;
              dedicatedServer.openFirewall = true;
            };
          };
        };
    };
  };
}

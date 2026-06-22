_: {
  caden.programs = {
    steam = {
      nixos =
        { pkgs, ... }:
        {
          boot.kernelModules = [ "ntsync" ];

          programs = {
            steam = {
              enable = true;
              gamescopeSession.enable = true;

              extraPackages = [
                pkgs.mangohud
                pkgs.gamemode
              ];
              extraCompatPackages = [ pkgs.proton-ge-bin ];

              remotePlay.openFirewall = true;
              dedicatedServer.openFirewall = true;
            };
          };
        };

      user = _: {
        extraGroups = [ "gamemode" ];
      };
    };
  };
}

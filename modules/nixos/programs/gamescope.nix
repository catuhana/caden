{ pkgs, ... }:
{
  boot.kernelModules = [ "ntsync" ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraPackages = [ pkgs.mangohud ];

      extraCompatPackages = [ pkgs.proton-ge-bin ];

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}

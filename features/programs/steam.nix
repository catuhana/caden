{ pkgs, ... }:
{
  imports = [ ./gamemode.nix ];

  boot.kernelModules = [ "ntsync" ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
      extraPackages = [
        pkgs.mangohud
        pkgs.gamemode
      ];

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}

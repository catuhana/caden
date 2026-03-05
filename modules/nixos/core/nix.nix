{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.core.nix;
in
{
  options.tuhana.core.nix = {
    gc.enable = mkEnableOption "automatic garbage collection" // {
      enable = true;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;

    nix = {
      package = pkgs.lixPackageSets.stable.lix;

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

      };

      optimise.automatic = true;

      gc = mkIf cfg.gc.enable {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };
    };
  };
}

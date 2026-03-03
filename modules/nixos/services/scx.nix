{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkDefault
    mkEnableOption
    ;

  cfg = config.tuhana.services.scx;
  kind = config.tuhana.system.kind;
in
{
  options.tuhana.services.scx = {
    enable = mkEnableOption "sched_ext" // {
      default = kind != "server";
    };
  };

  config = mkIf cfg.enable {
    services.scx.enable = true;
  };
}

{ lib, config, ... }:
{
  options = {
    scx.scheduler = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
  };
  config = {
    services.scx = {
      enable = true;
      scheduler = lib.mkIf (config.scx.scheduler != null) config.scx.scheduler;
    };
  };
}

{ config, lib, ... }:
{
  options.caden.services.scx.scheduler = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The sched_ext scheduler to use, or null for the default.";
  };

  config.services.scx = {
    enable = true;
  }
  // lib.optionalAttrs (config.caden.services.scx.scheduler != null) {
    scheduler = config.caden.services.scx.scheduler;
  };
}

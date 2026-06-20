{ config, ... }:
{
  services.thermald = {
    enable = true;
    configFile = "${config.services.thermald.package}/etc/thermald/thermal-conf.xml";
  };
}

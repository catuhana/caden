{ config, ... }:
{
  services.resolved.settings.Resolve.MulticastDNS =
    if config.services.avahi.enable then "resolve" else true;
}

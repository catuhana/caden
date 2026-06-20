_: {
  networking.networkmanager.dns = "systemd-resolved";

  services.resolved = {
    enable = true;

    settings.Resolve = {
      Domains = [ "~." ];
      DNSOverTLS = "opportunistic";
      LLMNR = false;
    };
  };
}

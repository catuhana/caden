{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkEnableOption
    ;

  cfg = config.tuhana.core.networking;

  DNS = {
    ips = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    dot = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
    ];
  };
in
{
  options.tuhana.core.networking = {
    customDNS.enable = mkEnableOption "custom DNS servers" // {
      default = true;
    };

    resolved = {
      enable = mkEnableOption "systemd-resolved for DNS" // {
        default = true;
      };

      mDNS = mkEnableOption "Multicast DNS";
    };
  };

  config = mkMerge [
    {
      networking = {
        timeServers = [ "time.cloudflare.com" ];
      };
    }
    (mkIf cfg.customDNS.enable {
      networking.nameservers = DNS.ips;
    })
    (mkIf cfg.resolved.enable {
      services.resolved = {
        enable = true;

        settings.Resolve = {
          Domains = [ "~." ];

          DNS = mkIf cfg.customDNS.enable DNS.dot;
          DNSOverTLS = "opportunistic";

          MulticastDNS = cfg.resolved.mDNS;
          LLMNR = false;
        };
      };
    })
  ];
}

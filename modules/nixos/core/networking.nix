{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkOption
    mkEnableOption
    types
    ;

  cfg = config.tuhana.core.networking;
  kind = config.tuhana.system.kind;

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

    captiveBrowser.interface = mkOption {
      type = types.nullOr types.str;
      default = null;
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
    (mkIf (cfg.customDNS.enable && cfg.captiveBrowser.interface != null && kind != "server") {
      programs.captive-browser = {
        enable = true;
        interface = cfg.captiveBrowser.interface;
      };
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

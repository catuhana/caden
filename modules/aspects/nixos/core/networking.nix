_: {
  caden.networking = {
    provides.dns = {
      provides.cloudflare = {
        nixos = _: {
          networking.nameservers = [
            "1.1.1.1"
            "1.0.0.1"
            "2606:4700:4700::1111"
            "2606:4700:4700::1001"
          ];

          services.resolved.settings.Resolve.DNS = [
            "1.1.1.1#cloudflare-dns.com"
            "1.0.0.1#cloudflare-dns.com"
            "2606:4700:4700::1111#cloudflare-dns.com"
            "2606:4700:4700::1001#cloudflare-dns.com"
          ];
        };
      };
    };

    provides.resolved = {
      nixos = _: {
        services.resolved = {
          enable = true;

          settings.Resolve = {
            Domains = [ "~." ];
            DNSOverTLS = "opportunistic";
            LLMNR = false;
          };
        };
      };

      provides.mdns = {
        nixos = _: {
          services.resolved.settings.Resolve.MulticastDNS = true;
        };
      };
    };
  };
}

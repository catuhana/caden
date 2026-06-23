_: {
  caden.core = {
    networking = {
      nixos = _: {
        networking = {
          nameservers = [
            "1.1.1.1#cloudflare-dns.com"
            "1.0.0.1#cloudflare-dns.com"
            "2606:4700:4700::1111#cloudflare-dns.com"
            "2606:4700:4700::1001#cloudflare-dns.com"
          ];
        };

        services.resolved = {
          enable = true;

          settings.Resolve = {
            DNSOverTLS = "opportunistic";
            Domains = [ "~." ];
            LLMNR = false;
          };
        };
      };

      mdns = {
        nixos =
          {
            config,
            ...
          }:
          {
            services.resolved.settings.Resolve.MulticastDNS =
              if config.services.avahi.enable then "resolve" else true;
          };
      };
    };
  };
}

_: {
  caden.core = {
    networking = {
      dns = {
        cloudflare = {
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

      resolved = {
        nixos = _: {
          networking.networkmanager.dns = "systemd-resolved";

          services.resolved = {
            enable = true;

            settings.Resolve = {
              Domains = [ "~." ];
              DNSOverTLS = "opportunistic";
              LLMNR = false;
            };
          };
        };

        mdns = {
          nixos = _: {
            services.resolved.settings.Resolve.MulticastDNS = true;
          };
        };
      };
    };
  };
}

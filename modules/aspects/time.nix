{
  caden.time = {
    nixos = {
      networking.timeServers = [
        "time.cloudflare.com"
        "pool.ntp.org"
      ];
    };

    provides.Istanbul.os = {
      time.timeZone = "Europe/Istanbul";
    };
  };
}

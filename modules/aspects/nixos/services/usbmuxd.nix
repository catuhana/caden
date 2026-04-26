_: {
  caden.services = {
    provides.usbmuxd = {
      nixos =
        { pkgs, ... }:
        {
          services.usbmuxd = {
            enable = true;
          };

          environment.systemPackages = [ pkgs.libimobiledevice ];
        };
    };
  };
}

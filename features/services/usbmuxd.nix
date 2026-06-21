_: {
  caden.services = {
    usbmuxd = {
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

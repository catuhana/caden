_: {
  caden.services = {
    usbmuxd = {
      nixos =
        { pkgs, ... }:
        {
          services.usbmuxd = {
            enable = true;
            package = pkgs.usbmuxd2;
          };

          environment.systemPackages = [ pkgs.libimobiledevice ];
        };
    };
  };
}

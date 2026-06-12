_: {
  caden.services = {
    bluetooth = {
      nixos = _: {
        hardware.bluetooth.settings.General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };
  };
}

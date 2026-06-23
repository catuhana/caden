_: {
  caden.desktops.common = {
    nixos = _: {
      services = {
        printing.enable = true;
        colord.enable = true;

        pipewire = {
          enable = true;

          pulse.enable = true;
          alsa.enable = true;
          jack.enable = true;
        };
      };
    };
  };
}

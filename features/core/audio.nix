_: {
  caden.core = {
    audio = {
      nixos = _: {
        services.pipewire = {
          enable = true;

          pulse.enable = true;
          alsa.enable = true;
          jack.enable = true;
        };
      };
    };
  };
}

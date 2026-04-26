# Maybe this file is not the best place to have this?
_: {
  caden.audio = {
    nixos = _: {
      services.pipewire = {
        enable = true;

        pulse.enable = true;
        alsa.enable = true;
        jack.enable = true;
      };
    };
  };
}

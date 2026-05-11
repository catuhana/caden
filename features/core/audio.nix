# Maybe this file is not the best place to have this?
# Or maybe even remove since desktop environment modules
# already enable them.
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

_: {
  caden.programs = {
    flatpak = {
      signal = {
        homeManager = _: {
          services.flatpak = {
            packages = [ "org.signal.Signal" ];

            overrides."org.signal.Signal".Environment.SIGNAL_PASSWORD_STORE = "gnome-libsecret";
          };
        };
      };
    };
  };
}

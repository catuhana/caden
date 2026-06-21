_: {
  caden.services = {
    flatpak = {
      nixos = _: {
        services.flatpak.enable = true;
      };

      homeManager = _: {
        services.flatpak = {
          enable = true;

          remotes = [
            {
              name = "flathub";
              location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
          ];

          packages = [
            "com.anydesk.Anydesk"
            "com.google.Chrome"
            "com.obsproject.Studio"
            "com.protonvpn.www"
            "com.usebottles.bottles"
            "dev.khcrysalis.PlumeImpactor"
            "md.obsidian.Obsidian"
            "me.timschneeberger.GalaxyBudsClient"
            "org.gnome.Fractal"
            "org.libreoffice.LibreOffice"
            "org.musicbrainz.Picard"
            "org.nicotine_plus.Nicotine"
            "org.signal.Signal"
          ];

          overrides = {
            "com.google.Chrome".Context.filesystems = [
              "~/.local/share/applications:create"
              "~/.local/share/icons:create"
            ];

            "org.signal.Signal".Environment.SIGNAL_PASSWORD_STORE = "gnome-libsecret";
          };
        };
      };
    };
  };
}

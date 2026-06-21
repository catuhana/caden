_: {
  caden.programs = {
    flatpak = {
      chrome = {
        homeManager = _: {
          services.flatpak = {
            packages = [ "com.google.Chrome" ];

            overrides."com.google.Chrome".Context.filesystems = [
              "~/.local/share/applications:create"
              "~/.local/share/icons:create"
            ];
          };
        };
      };
    };
  };
}

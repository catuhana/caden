{ inputs, ... }: {
  caden.programs = {
    chrome-dev = {
      os = {
        nixpkgs.overlays = [
          (
            final: prev:
            prev.lib.optionalAttrs (
              inputs.browser-previews.packages ? ${prev.stdenv.hostPlatform.system}
            ) inputs.browser-previews.packages.${prev.stdenv.hostPlatform.system}
          )
        ];
      };

      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.google-chrome-dev
        ];
      };
    };
  };
}

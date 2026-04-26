{ inputs, ... }: {
  caden.programs = {
    provides.claude-desktop = {
      os = _: {
        nixpkgs.overlays = [ inputs.claude-desktop.overlays.default ];
      };
    };
  };
}

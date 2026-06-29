_: {
  caden.programs = {
    nix-ld = {
      nixos = _: {
        programs.nix-ld.enable = true;
      };
    };
  };
}
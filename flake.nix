{
  description = "Cat's den.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    den.url = "github:denful/den";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # lanzaboote PR #456 — XBOOTLDR / split ESP+/boot support (unmerged).
    # Pinned to the PR head commit (sarunint:xbootldr), fetched via the upstream repo path.
    lanzaboote = {
      url = "github:nix-community/lanzaboote/8582371c391b345b158d08942ef459f4251e1c01";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      imports = [
        inputs.den.flakeModule
        ./den.nix

        (inputs.import-tree [
          ./features
          ./hosts
          ./users
        ])
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = import ./devshell.nix { inherit pkgs; };
          formatter = import ./formatter.nix { inherit pkgs; };
        };
    };
}

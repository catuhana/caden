{
  description = "Cat's den.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:denful/import-tree";
    den.url = "github:denful/den";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      # https://github.com/nix-community/lanzaboote/pull/456 - XBOOTLDR support.
      url = "github:nix-community/lanzaboote/8582371c391b345b158d08942ef459f4251e1c01";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      systems,
      flake-parts,

      import-tree,
      den,

      treefmt-nix,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [
        den.flakeModule
        treefmt-nix.flakeModule

        ./den.nix

        (import-tree [
          ./features
          ./hosts
          ./users
        ])
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells = import ./devshell.nix {
            inherit (pkgs)
              mkShellNoCC
              nixd
              nixfmt
              ;
          };

          treefmt = import ./formatter.nix { };
        };
    };
}

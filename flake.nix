{
  description = "Cat's den.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

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
      self,
      nixpkgs,
      flake-parts,
      systems,
      treefmt-nix,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [
        treefmt-nix.flakeModule
      ];

      flake = {
        nixosConfigurations.MateBookD14 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./features/core/common.nix
            ./hosts/MateBookD14/host.nix
          ];
        };
      };

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

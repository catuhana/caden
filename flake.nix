{
  description = "Tuhana's Nix configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      disko,
      lanzaboote,
      ...
    }@inputs:
    let
      mkSystem = import ./lib/mkSystem.nix {
        inherit (inputs) home-manager;
        inherit (inputs.nixpkgs.lib) nixosSystem;
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      flake.nixosConfigurations = {
        MateBookD14 = mkSystem {
          hostName = "MateBookD14";
          system = "x86_64-linux";
          kind = "laptop";

          extraModules = [
            disko.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixd
            ];
          };

          formatter = pkgs.nixfmt-tree;
        };
    };
}

{
  description = "Cat's den.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      cadenLib = import ./lib { inherit (inputs.nixpkgs) lib; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      flake.nixosConfigurations.MateBookD14 = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cadenLib; };

        modules = [
          ./modules/nixos/common.nix
          ./hosts/MateBookD14/configuration.nix
        ];
      };

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = import ./devshell.nix { inherit pkgs; };

          formatter = import ./formatter.nix { inherit pkgs; };
        };
    };
}

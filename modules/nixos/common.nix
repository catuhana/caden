{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      inputs.claude-desktop.overlays.default
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  nix = {
    package = pkgs.lixPackageSets.latest.lix;

    settings = {
      auto-allocate-uids = true;
      auto-optimise-store = true;

      extra-substituters = [
        "https://nix-community.cachix.org"
      ];

      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      keep-going = true;

      trusted-users = [ "@wheel" ];

      use-cgroups = true;
      use-xdg-base-directories = true;

      experimental-features = [
        "nix-command"
        "flakes"
        "cgroups"
        "auto-allocate-uids"
      ];
    };
  };
}

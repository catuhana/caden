{ inputs, ... }:
{
  den.aspects.MateBookD14.nixos = {
    imports = [
      inputs.disko.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}

{ inputs, ... }:
{
  caden.core.sops = {
    nixos =
      { config, ... }:
      {
        imports = [ inputs.sops-nix.nixosModules.sops ];

        sops.defaultSopsFile = ../../secrets/hosts/${config.networking.hostName}.yaml;
      };

    homeManager =
      {
        config,
        pkgs,
        lib,
        ...
      }:
      {
        imports = [ inputs.sops-nix.homeManagerModules.sops ];

        sops.age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519_caden" ];

        home.activation = {
          sopsAgeKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            if [ -f "$HOME/.ssh/id_ed25519_caden" ]; then
              mkdir -p "$HOME/.config/sops/age"

              ${lib.getExe pkgs.ssh-to-age} -private-key -i "$HOME/.ssh/id_ed25519_caden" \
                > "$HOME/.config/sops/age/keys.txt"
              chmod 600 "$HOME/.config/sops/age/keys.txt"
            fi
          '';
        };
      };
  };
}

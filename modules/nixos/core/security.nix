{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkEnableOption
    ;

  cfg = config.tuhana.core.security;
in
{
  options.tuhana.core.security = {
    apparmor.enable = mkEnableOption "AppArmor";

    useSudoRs = mkEnableOption "`sudo-rs` instead of `sudo`" // {
      default = true;
    };

    tpm2.enable = mkEnableOption "TPM2 support";
  };

  config = mkMerge [
    (mkIf cfg.apparmor.enable {
      security.apparmor = {
        enable = true;
        packages = [ pkgs.apparmor-profiles ];
      };
    })

    (mkIf cfg.useSudoRs {
      security = {
        sudo.enable = false;
        sudo-rs.enable = true;
      };
    })

    (mkIf cfg.tpm2.enable {
      security.tpm2 = {
        enable = true;

        abrmd.enable = true;
        pkcs11.enable = true;

        tctiEnvironment = {
          enable = true;
          interface = "tabrmd";
        };
      };
    })
  ];
}

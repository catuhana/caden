{ den, ... }:
{
  den = {
    default = {
      includes = [
        den.provides.define-user
        den.provides.primary-user
      ];

      # FIXME: These should be host-specific.
      nixos.system.stateVersion = "26.05";
      homeManager.home.stateVersion = "26.05";
    };

    schema.user.classes = [ "homeManager" ];
  };
}

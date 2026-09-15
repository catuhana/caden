_: {
  programs = {
    nixfmt.enable = true;

    shellcheck = {
      enable = true;

      excludes = [ ".envrc" ];
    };

    prettier = {
      enable = true;

      includes = [
        "*.md"
        "*.ya?ml"
        "*.json"
      ];
    };
  };
}

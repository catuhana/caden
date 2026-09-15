_: {
  programs = {
    nixfmt.enable = true;

    prettier = {
      enable = true;
      includes = [
        "*.md"
        "*.json"
      ];
    };
  };
}

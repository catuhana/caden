# Should just enable all languages I think,
# and the user will choose which language to
# use in their DE or whatever.
_: {
  caden.core = {
    locale = {
      nixos = _: {
        i18n.defaultLocale = "en_GB.UTF-8";
      };

      tr_TR = {
        nixos = _: {
          i18n.extraLocales = [ "tr_TR.UTF-8/UTF-8" ];
        };
      };
    };
  };
}

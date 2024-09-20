{ config, lib, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    #enablePlasmaBrowserIntegration = true;
    commandLineArgs = [ "--enable-features=TouchpadOverscrollHistoryNavigation" "--disable-experiments"];
    extensions = [
      # ublock origin
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      # lastpass
      "hdokiejnpimakedhajhdlcegeplioahd"
      # dark reader
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      # enhancer for youtube
      "ponfpcnoihfmfllpaingbgckeeldkhle"
      # sponsor block
      "mnjggcdmjocbbbhaepdhchncahnbgone"
      # return youtube dislike button
      "gebbhagfogifgggkldgodflihgfeippi"
    ];
  };
}

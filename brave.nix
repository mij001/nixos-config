{ config, lib, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    
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

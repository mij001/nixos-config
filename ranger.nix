{ config, lib, pkgs, ... }:
{
  programs.ranger = {
    enable = true;

  };

  home.packages = with pkgs; [
    ripdrag
    highlight
  ];
}

{ config, pkgs, ... }:{
  home.file."touchegg".target = "/home/inomal/.config/touchegg/touchegg.conf";
  home.file."touchegg".source = ./touchegg.conf;
}


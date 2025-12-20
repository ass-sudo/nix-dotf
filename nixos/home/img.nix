{ config, pkgs, ... }:

{
  home.file = {
    "Wallpaper".source = ../img/Wallpaper;
    "Pictures".source = ../img/Pictures;
  };
}

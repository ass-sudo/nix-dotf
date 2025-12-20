{ config, pkgs, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
    "Wallpaper".source = ../dotfiles/Wallpaper;
    ".local/share/icons".source = ../dotfiles/icons;
    ".local/share/themes".source = ../dotfiles/gtk-themes;
  };
}

{ config, pkgs, ... }:

{
  home.file = {
    ".config/waybar".source = ../dotfiles/waybar;
    ".config/rofi".source = ../dotfiles/rofi;
    ".config/hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
    ".config/fastfetch".source = ../dotfiles/fastfetch;
    ".config/fish".source = ../dotfiles/fish;
    "Wallpaper".source = ../dotfiles/Wallpaper;
    ".local/share/icons".source = ../dotfiles/icons;
    ".local/share/themes".source = ../dotfiles/gtk-themes;
    ".config/alacritty".source = ../dotfiles/alacritty;
    ".config/kitty".source = ../dotfiles/kitty;
  };
}

{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/waybar".source = ../dotfiles/waybar;
    ".config/kitty/kitty.conf".source = ../dotfiles/kitty/kitty.conf;
    ".config/rofi".source = ../dotfiles/rofi;
    ".config/hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
    ".config/fastfetch".source = ../dotfiles/fastfetch;
    ".config/fish".source = ../dotfiles/fish;
    "Wallpaper".source = ../dotfiles/Wallpaper;
    ".local/share/icons".source = ../dotfiles/icons;
    ".local/share/themes".source = ../dotfiles/gtk-themes;
    ".mozilla/firefox/*default*/chrome".source = ../dotfiles/chrome;
  };
}

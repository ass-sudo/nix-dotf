{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./programs/waybar.nix
    ./programs/rofi.nix
    ./programs/kitty.nix
    ./programs/alacritty.nix
    ./programs/fish.nix
    ./packages.nix
    ./img.nix
    ./programs/git.nix
    ./programs/theme.nix
    ./programs/nvf.nix
    ./programs/fastfetch.nix
    ./programs/hyprland.nix
    ./programs/firefox.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "phinger-cursors-dark";
    };
  };

  home.stateVersion = "26.05";
}

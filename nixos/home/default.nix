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
    ./dotfiles.nix
    ./programs/git.nix
    ./programs/nvf.nix
    ./programs/fastfetch.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Space-dark";
      icon-theme = "Slot-Multicolor-Dark-Icons";
      cursor-theme = "phinger-cursors-dark";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };

  home.stateVersion = "26.05";
}

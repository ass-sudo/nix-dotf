{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./programs/fish.nix
    ./packages.nix
    ./dotfiles.nix
    ./programs/git.nix
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

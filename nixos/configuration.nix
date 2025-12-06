{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/hyprland.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/zapret.nix
  ];

  system.stateVersion = "24.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 1d";
    };
  };

  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "storage"];
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nixos";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.variables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "24";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    unzip
    zip
    phinger-cursors
    gsettings-desktop-schemas
  ];

  security.sudo.enable = true;
}

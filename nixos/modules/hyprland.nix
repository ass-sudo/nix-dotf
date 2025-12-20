{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = lib.mkForce false;
  services.displayManager.gdm.enable = lib.mkForce false;

  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "hyprland";

  };
}


{ config, pkgs, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    
    extraConfig = {
      modi = "drun";
      font = "JetBrainsMono Nerd Font 11";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      terminal = "kitty";
      drun-display-format = "{name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "  ";
      sidebar-mode = false;
    };

    theme = {
      "@import" = "~/.cache/wal/colors-rofi-dark.rasi";

      "element-text, element-icon, mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      "window" = {
        height = mkLiteral "400px";
        width = mkLiteral "280px";
        border = mkLiteral "0px";
        background-color = mkLiteral "@background";
        border-radius = mkLiteral "0px";
        padding = mkLiteral "8px";
      };

      "mainbox" = {
        background-color = mkLiteral "@background";
      };

      "inputbar" = {
        children = map mkLiteral [ "textbox-prompt-colon" "entry" ];
        background-color = mkLiteral "rgba(255, 255, 255, 0.08)";
        border-radius = mkLiteral "0px";
        padding = mkLiteral "4px";
        margin = mkLiteral "0px 0px 8px 0px";
      };

      "prompt" = {
        enabled = false;
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = "󱄅";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "rgba(255, 255, 255, 0.6)";
        padding = mkLiteral "6px 8px";
        font = "JetBrainsMono Nerd Font 14";
      };

      "entry" = {
        padding = mkLiteral "6px 8px";
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "transparent";
        placeholder = "Type to filter";
        placeholder-color = mkLiteral "rgba(255, 255, 255, 0.3)";
      };

      "listview" = {
        border = mkLiteral "0px";
        padding = mkLiteral "0px";
        margin = mkLiteral "0px";
        columns = 1;
        lines = 8;
        background-color = mkLiteral "@background";
        scrollbar = false;
        spacing = mkLiteral "4px";
      };

      "element" = {
        padding = mkLiteral "8px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        border-radius = mkLiteral "0px";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        margin = mkLiteral "0 8px 0 0";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
        border-radius = mkLiteral "0px";
      };

      "mode-switcher" = {
        enabled = false;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
      };
    };
  };
}

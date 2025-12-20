{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      shell = "fish";
      window_padding_width = 0;
      background_opacity = "1.0";
      background_blur = 0;
      enable_audio_bell = false;
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";

      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";

      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };

    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
    '';
  };
}

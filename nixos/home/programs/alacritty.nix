{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "~/.cache/wal/colors-alacritty.toml"
      ];

      font = {
        normal = { family = "JetBrains Mono Nerd Font"; style = "SemiBold"; };
        bold = { family = "JetBrains Mono Nerd Font"; style = "Bold"; };
        italic = { family = "JetBrains Mono Nerd Font"; style = "SemiBold Italic"; };
        bold_italic = { family = "JetBrains Mono Nerd Font"; style = "Bold Italic"; };
        size = 10.0;
      };

      terminal.shell.program = "fish";

      cursor = {
        style = { shape = "Block"; blinking = "Always"; };
        vi_mode_style = { shape = "Block"; };
      };

      keyboard.bindings = [
        { key = "C"; mods = "Control"; action = "Copy"; }
        { key = "V"; mods = "Control"; action = "Paste"; }
        { key = "Plus"; mods = "Control"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
      ];
    };
  };
}

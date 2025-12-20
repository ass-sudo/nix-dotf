{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      
      logo = {
        type = "kitty-icat";
        source = "NixOS";
        width = 8;
        height = 8;
        padding = {
          top = 1;
          left = 2;
        };
      };

      display = {
        separator = "  ";
        color = {
          keys = "white";
        };
      };

      modules = [
        { type = "custom"; format = " "; }
        { type = "custom"; format = " "; }
        { type = "custom"; format = " "; }
        {
          type = "custom";
          format = "{#39}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━";
        }
        { type = "custom"; format = ""; }
        {
          key = "  {#35}  ";
          type = "title";
          format = "{user-name}@{host-name}";
        }
        { type = "custom"; format = ""; }
        {
          key = "  {#34}󱄅  ";
          type = "os";
        }
        {
          key = "  {#35}  ";
          type = "kernel";
        }
        {
          key = "  {#34}  ";
          type = "shell";
        }
        {
          key = "  {#35}󱂬  ";
          type = "wm";
        }
        { type = "custom"; format = ""; }
        {
          key = "  {#34}󰍛  ";
          type = "cpu";
          showPeCoreCount = true;
        }
        {
          key = "  {#35}󰢮  ";
          type = "gpu";
        }
        {
          key = "  {#34}  ";
          type = "memory";
        }
        {
          key = "  {#35}󰋊  ";
          type = "disk";
          folders = "/";
        }
        { type = "custom"; format = ""; }
        {
          type = "custom";
          format = "{#39}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━";
        }
        { type = "custom"; format = ""; }
      ];
    };
  };
}

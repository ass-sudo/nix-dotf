{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        height = 30;
        spacing = 0;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        
        modules-center = [];
        
        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "memory"
          "cpu"
          "temperature"
          "clock"
          "tray"
        ];
        
        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "1" = [];
          };
        };
        
        "hyprland/window" = {
          format = "{}";
          max-length = 50;
          separate-outputs = true;
        };
        
        "hyprland/language" = {
          format = "{}";
          format-en = " EN";
          format-ru = " RU";
        };
        
        tray = {
          icon-size = 16;
          spacing = 8;
        };
        
        clock = {
          format = " {0:%d/%m}   {0:%H:%M:%S}";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };
        
        cpu = {
          interval = 2;
          format = " {usage}%";
          tooltip = true;
        };
        
        memory = {
          interval = 2;
          format = " {used:0.1f}G";
          tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G ({percentage}%)";
        };
        
        temperature = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format = " {temperatureC}°C";
          format-critical = " {temperatureC}°C";
        };
        
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon}  {volume}%";
          format-muted = "  Muted";
          format-icons = {
            default = ["" "" ""];
          };
          scroll-step = 5;
          on-click = "pavucontrol";
          ignored-sinks = ["Easy Effects Sink"];
        };
      };
    };
    
    style = ''
      @import url("/home/nixos/.cache/wal/colors-waybar.css");
      
      * {
        border: none;
        border-radius: 0; 
        font-family: "CodeNewRoman Nerd Font Propo", "JetBrainsMono Nerd Font", sans-serif; 
        font-size: 13px;
        min-height: 0;
      }
      
      window#waybar {
        background-color: @background; 
        color: @foreground;            
        opacity: 1.0;                 
      }
      
      #workspaces {
        background: transparent;
        margin: 0;
        padding: 0;
      }
      
      #workspaces button {
        padding: 0 12px;
        background: transparent;
        color: @color8; 
        border-bottom: 2px solid transparent;
        border-radius: 0;
      }
      
      #workspaces button.active {
        color: @foreground;
        background-color: @color0; 
        border-bottom: 2px solid @color4; 
      }
      
      #workspaces button:hover {
        background: @color1; 
        color: @background;
      }
      
      #window {
        padding: 0 15px;
        color: @foreground;
        background: transparent;
      }
      
      #tray,
      #language,
      #pulseaudio,
      #memory,
      #cpu,
      #temperature,
      #clock,
      #custom-power {
        padding: 0 12px;
        background: transparent;
        color: @foreground;
      }
      
      #cpu {
        color: @color1; 
      }
      
      #memory {
        color: @color2; 
      }
      
      #temperature {
        color: @color3; 
      }
      
      #temperature.critical {
        background-color: @color1; 
        color: @background;
      }
      
      #pulseaudio {
        color: @color4; 
      }
      
      #pulseaudio.muted {
        color: @color8; 
      }
      
      #language {
        color: @color5; 
      }
      
      #clock {
        color: @color6; 
        font-weight: bold;
      }
      
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }
      
      #custom-power {
        color: @color1;
        font-size: 16px;
        padding: 0 15px;
      }
      
      #custom-power:hover {
        background: @color1;
        color: @background;
      }
    '';
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ]; 
}

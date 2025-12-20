{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true; 

    settings = {
      "$mainMod" = "MOD3";
      "$screenshot" = "grim -g \"$(slurp)\" ~/Pictures/screenshot.png";
      "$browser" = "firefox";
      "$rofi" = "rofi -show drun";
      "$swww" = "swww-daemon";
      "$autoswww" = "swww img ~/Wallpaper/1.* --transition-type none && wal -i ~/Wallpaper/1.*";
      "$volum" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
      "$mute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
        "DP-1, 1920x1080@165, 1920x0, 1"
      ];

      env = [
        "XCURSOR_THEME, phinger-cursors-dark"
        "XCURSOR_SIZE, 24"
      ];

      "exec-once" = [
        "$swww & $autoswww & waybar"
      ];

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 0;
        layout = "dwindle";
        resize_on_border = true;
        no_focus_fallback = false;
      };

      animations = {
        enabled = false;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "caps:hyper";
        follow_mouse = 1;
      };

      bind = [
        "$mainMod, SPACE, exec, hyprctl switchxkblayout all next"
        "$mainMod, E, exec, alacritty"
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, R, exec, $rofi"
        "$mainMod, S, exec, kitty -e yazi"
        "$mainMod, W, exec, $browser"
        "$mainMod, D, exec, Telegram"
        "$mainMod, T, exec, discord"
        "ALT SHIFT, S, exec, $screenshot"
        "$mainMod, A, exec, steam"
        "SUPER ALT SHIFT, S, exec, systemctl suspend"
        "SUPER ALT SHIFT, Q, exec, poweroff"
        "SUPER ALT SHIFT, R, exec, reboot"

        "CTRL SHIFT, 0, exec, pkill mpvpaper; swww img ~/Wallpaper/0.* --transition-type none"
        "CTRL SHIFT, 9, exec, pkill mpvpaper; swww img ~/Wallpaper/9.* --transition-type none"
        "CTRL SHIFT, 8, exec, pkill mpvpaper; swww img ~/Wallpaper/8.* --transition-type none"
        "CTRL SHIFT, 7, exec, pkill mpvpaper; swww img ~/Wallpaper/7.* --transition-type none"
        "CTRL SHIFT, 6, exec, pkill mpvpaper; swww img ~/Wallpaper/6.* --transition-type none"
        "CTRL SHIFT, 5, exec, pkill mpvpaper; swww img ~/Wallpaper/5.* --transition-type none"
        "CTRL SHIFT, 4, exec, pkill mpvpaper; swww img ~/Wallpaper/4.* --transition-type none"
        "CTRL SHIFT, 3, exec, pkill mpvpaper; swww img ~/Wallpaper/3.* --transition-type none"
        "CTRL SHIFT, 2, exec, pkill mpvpaper; swww img ~/Wallpaper/2.* --transition-type none"
        "CTRL SHIFT, 1, exec, pkill mpvpaper; swww img ~/Wallpaper/1.* --transition-type none"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod CTRL, Q, exit"
        "$mainMod CTRL, R, exec, hyprctl reload"
        "$mainMod, G, togglefloating"
        
        ", XF86AudioRaiseVolume, exec, $volum 5%+"
        ", XF86AudioLowerVolume, exec, $volum 5%-"
        ", XF86AudioMute, exec, $mute"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindr = [
        "$mainMod, $mainMod, exec, wtype -k Escape"
      ];
    };
  };
}

{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "lsd -lah";
      la = "lsd -a";
      ls = "lsd";
      ".." = "cd ..";
      "..." = "cd ../..";
      nvf = "nvim";
      snvf = "sudo nvim";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gcl = "git clone";
      gp = "git push";
      gpom = "git push origin main";
      r = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      u = "sudo nix flake update";
      cb = "cargo build";
      cr = "cargo run";
      grep = "grep --color=auto";
    };

    functions = {
      fish_prompt = {
        body = ''echo "> "'';
      };
      
      fish_command_not_found = {
        body = ''
          if string match -qr '^[0-9+\-*/.^]+$' $argv[1]
              math $argv[1]
          else
              echo "fish: Unknown command: $argv[1]"
          end
        '';
      };
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch

      function =
          set -l expr (string join ' ' $argv)
          python3 -c "import math; print($expr)"
      end

      function calc
          set -l expr (string join ' ' $argv)
          python3 -c "from math import *; print($expr)"
      end
    '';
  };
}

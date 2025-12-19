alias ll='lsd -lah'
alias la='lsd -a'
alias ls='lsd'
alias ..='cd ..'
alias ...='cd ../..'
alias nvf='nvim'
alias snvf='sudo nvim'
alias grep='grep --color=auto'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias gp='git push'
alias gpom='git push origin main'
alias rebuild='sudo nixos-rebuild switch --flake /etc/nixos#nixos'
alias update='sudo nix flake update'
alias cb='cargo build'
alias cr='cargo run'

function fish_command_not_found
    if string match -qr '^[0-9+\-*/.^]+$' $argv[1]
        math $argv[1]
    else
        echo "fish: Unknown command: $argv[1]"
    end
end

function =
    set -l expr (string join ' ' $argv)
    python3 -c "import math; print($expr)"
end

function calc
    set -l expr (string join ' ' $argv)
    python3 -c "from math import *; print($expr)"
end

if status is-interactive
    fastfetch
    set -g fish_greeting ""
end

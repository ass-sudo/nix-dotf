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
alias gp='git push'
alias gpam='git push origin main'
alias gpl='git clone'
alias rebuild='sudo nixos-rebuild switch --flake /etc/nixos#nixos'
alias update='sudo nix flake update'

if status is-interactive
    fastfetch
    set -g fish_greeting ""
end

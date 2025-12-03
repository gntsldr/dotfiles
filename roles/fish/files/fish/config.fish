function fish_title
    if set -q SSH_CONNECTION
        hostname
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

starship init fish | source

fzf --fish | source

zoxide init --cmd cd fish | source

abbr -a egrep 'egrep --color=auto'
abbr -a fgrep 'fgrep --color=auto'
abbr -a grep 'grep --color=auto'
#abbr -a ls 'ls --color=auto'
abbr -a ls 'eza --color=always --icons=auto --group-directories-first --group'
abbr -a ll 'eza -la --color=always --icons=auto --group-directories-first --group'
abbr -a tree 'eza --tree --color=always --icons=auto'
abbr -a df 'dysk'
abbr -a dysk 'dysk --units binary'
abbr -a du 'dust'
abbr -a cat 'bat --paging=never'
abbr -a neofetch 'fastfetch -c ~/.config/fastfetch/presets/neofetch.jsonc'
abbr -a k 'kubectl'

# Autostart Zellij
# if set -q ZELLIJ
# else
#   zellij
# end

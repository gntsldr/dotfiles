function fish_title
    if set -q SSH_CONNECTION
        hostname
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add to PATH
fish_add_path -U $HOME/bin
fish_add_path -U $HOME/.local/bin
fish_add_path -U $HOME/.dotfiles/bin
fish_add_path -U /opt/nvim-linux64/bin

# Disable greeting message
set -Ux fish_greeting

# Set Home config directory
set -Ux XDG_CONFIG_HOME $HOME/.config

# Set editor to micro
set -Ux EDITOR micro
set -Ux KUBE_EDITOR micro
set -Ux MICRO_TRUECOLOR 1
set -Ux COLORTERM truecolor

# Set up fzf to use fd
set -Ux FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -Ux FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -Ux FZF_ALT_C_OPTS "'--preview 'eza --tree --color=always {} | head -200'"

# If the zellij session already exists, attach to the default session. (not starting as a new session)
set -Ux ZELLIJ_AUTO_ATTACH true

# When zellij exits, the shell exits as well
# set -Ux ZELLIJ_AUTO_EXIT true

starship init fish | source

fzf --fish | source

zoxide init --cmd cd fish | source

# Add aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
#alias ls='ls --color=auto'
alias ls='eza --color=always --icons=auto --group-directories-first --group'
alias ll='eza -la --color=always --icons=auto --group-directories-first --group'
alias tree='eza --tree --color=always --icons=auto'
alias df='dysk'
alias dysk='dysk --units binary'
alias du='dust'
alias cat='bat --paging=never'
alias neofetch='fastfetch -c ~/.config/fastfetch/presets/neofetch.jsonc'
abbr -a k 'kubectl'

# Autostart Zellij
# if set -q ZELLIJ
# else
#   zellij
# end

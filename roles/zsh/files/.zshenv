# Add to PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"

# Set editor to micro
export EDITOR=micro
export KUBE_EDITOR=micro
export MICRO_TRUECOLOR=1
export COLORTERM=truecolor

# Set up fzf to use fd
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# If the zellij session already exists, attach to the default session. (not starting as a new session)
export ZELLIJ_AUTO_ATTACH=true

# When zellij exits, the shell exits as well
# export ZELLIJ_AUTO_EXIT=true

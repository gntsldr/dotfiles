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
export FZF_DEFAULT_COMMAND="fd --type f --hidden"
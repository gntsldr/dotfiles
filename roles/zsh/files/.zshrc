# Set the window title
function title()
{
   echo -n -e "\033]0;$*\007"
}
title $(hostname)

# Reset the window title after the ssh command
function ssh()
{
   /usr/bin/ssh "$@"
   title $(hostname)
}

# Reset the window title after the su command
function su()
{
   /bin/su "$@"
   title $(hostname)
}

#DISABLE_AUTO_TITLE="true"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# key bindings
bindkey "^[[3~" delete-char #del
bindkey "2~" delete-char #shift+del
bindkey "^[[H" beginning-of-line #home
bindkey ";2H" beginning-of-line #shift+home
bindkey "^[[F" end-of-line #end
bindkey ";2F" end-of-line #shift+end
bindkey ";2A" beginning-of-line #shift+up
bindkey ";2B" end-of-line #shift+down
bindkey ";5A" beginning-of-line #ctrl+up
bindkey ";5B" end-of-line #ctrl+down
bindkey ";2D" backward-word #shift+left
bindkey ";2C" forward-word #shift+right
bindkey ";5D" backward-word #ctrl+left
bindkey ";5C" forward-word #ctrl+right

# Add aliases for color
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
#alias ls='ls --color=auto'
alias ls='eza --icons=auto --group-directories-first --group'
alias ll='eza -la --icons=auto --group-directories-first --group'
alias tree='eza -tree --icons=auto'
alias df='df -h'
#alias cat='bat'

# Start Zellij
#eval "$(zellij setup --generate-auto-start zsh)"

# Start Starship
eval "$(starship init zsh)"

# Start Zoxide
eval "$(zoxide init zsh)"

# Enable zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable zsh-syntax-highlighting
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

# Autocomplete for Terraform
complete -o nospace -C /usr/bin/terraform terraform

# Alias for dotfile management with git
#alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add to PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"

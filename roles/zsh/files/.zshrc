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

# Reset the window title after exiting zellij
#function zellij()
#{
#   /usr/local/bin/zellij "$@"
#   title $(hostname)
#}

#DISABLE_AUTO_TITLE="true"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
# setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt APPEND_HISTORY            # append to history file

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# key bindings
bindkey "\e[[3~" delete-char #del
bindkey "\e[3;2~" delete-word #shift+del
bindkey "\eOH" beginning-of-line #home
bindkey "\e[1;2H" beginning-of-line #shift+home
bindkey "\eOF" end-of-line #end
bindkey "\e[1;2F" end-of-line #shift+end
bindkey "\e[1;2A" beginning-of-line #shift+up
bindkey "\e[1;2B" end-of-line #shift+down
bindkey "\e[1;5A" beginning-of-line #ctrl+up
bindkey "\e[1;5B" end-of-line #ctrl+down
bindkey "\e[1;2D" backward-word #shift+left
bindkey "\e[1;2C" forward-word #shift+right
bindkey "\e[1;5D" backward-word #ctrl+left
bindkey "\e[1;5C" forward-word #ctrl+right

# Add aliases for color
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
#alias ls='ls --color=auto'
alias ls='eza --icons=auto --group-directories-first --group'
alias ll='eza -la --icons=auto --group-directories-first --group'
alias tree='eza --tree --icons=auto'
alias df='dysk'
alias dysk='dysk --units binary'
alias du='dust'
alias cat='bat --paging=never'
alias neofetch='fastfetch -c ~/.config/fastfetch/presets/neofetch.jsonc'

source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# Enable zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable zsh-syntax-highlighting
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -U +X bashcompinit && bashcompinit

# Autocomplete for Terraform
complete -o nospace -C /usr/bin/terraform terraform

# Zellij completions
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () { 
   if [ -z "$1" ]; then
      zellij pipe;
   else 
      zellij pipe -p $1;
   fi
}

# Alias for dotfile management with git
#alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Start Starship
eval "$(starship init zsh)"

# Start Zoxide and replace cd
eval "$(zoxide init zsh --cmd cd)"

# Start Zellij
#eval "$(zellij setup --generate-auto-start zsh)"

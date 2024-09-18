source $HOME/.zprofile
source $HOME/.zsh_aliases
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory autocd extendedglob nomatch menucomplete

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

#Start zap
# Example install of plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"

# Example install of a plugin pinned to specifc commit or branch, just pass the git reference
plug "zsh-users/zsh-syntax-highlighting"

#spaceship prompt
plug "spaceship-prompt/spaceship-prompt"

# export PS1="%{%F{198}%}%n%{%F{35}%}@%{%F{166}%}%m %{%F{29}%}%1~ %{%f%}$ "

# Example install of a zsh completion
plug "esc/conda-zsh-completion"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# Up arrow
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# Down arrow
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="$PATH:/opt/nvim-linux64/bin"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# powershell.exe -File C:\\Users\\LeviShevick\\kmonad.ps1 

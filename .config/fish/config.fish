if status is-interactive
    # Commands to run in interactive sessions can go here
end

function !!;
  set var (history | head -n 1)
  if test $argv
    if test $argv = "sudo"        #; or "any other command you want to prepend"
        eval $argv $var
    else
        eval $var $argv
    end
    else
        eval $var
  end
end

alias c='clear'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias settings='xfce4-settings-manager'
alias please='!! sudo'
alias vimrc='vim ~/.vimrc'
alias network='nmtui'
alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias gpl='git pull'
neofetch


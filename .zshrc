unalias run-help && autoload run-help
autoload compinit && compinit
autoload colors && colors
zmodload -i zsh/complist

setopt autocd
setopt autopushd
setopt completeinword
setopt correct
setopt extendedglob
setopt histignoredups
setopt histnofunctions
setopt histreduceblanks
setopt nobeep
setopt nocheckjobs
setopt nohup
setopt numericglobsort
setopt printexitvalue

bindkey -e
bindkey "^[[5~" beginning-of-line
bindkey "^[[6~" end-of-line

PROMPT="%{$fg[white]%}%n %{$fg_bold[yellow]%}%~%{$reset_color%} "
RPROMPT="%{$fg_bold[yellow]%}%D{%H:%M:%S}%{$reset_color%}"

alias dirs='dirs -v'
alias du='du -h'
alias df='df -h'
alias ls='ls --color=auto'
alias ri='noglob ri'
alias -g ...='../..'
alias -g ....='../../..'
alias -g ,g='|grep'
alias -g ,n='&>/dev/null'
alias -g ,p='|$PAGER'
alias -g ,pj=',n ,p -Ip'
alias -g ,w='|wc'
alias jbo='noglob rdict -h lojban.org'
alias gismu='<~/.gismu grep'
alias cmavo='<~/.cmavo grep'
alias install='sudo pacman -S'
alias owns='pacman -Qo'
alias pkginfo='pacman -Qi'
alias pkgfiles='pacman -Ql'

function set-title {
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l$*\e\\"
      ;;
    *xterm*|rxvt*|(dt|k|E)term) print -Pn "\e]2;$*\a"
      ;;
  esac
}

function chpwd {
  set-title "%n %~"
}

function preexec {
  set-title "$1"
}

function precmd {
  set-title "%n %~"
}

function maybe {
  command=$1
  shift
  echo $@ | xargs -r -p ${=command}
}

function todo {
  if [ $#argv = 0 ]; then
    less ~/.todo
  else
    formatted=$(print -P "%D{%F}, $1: $2")
    print $formatted >>~/.todo
    print $formatted
  fi
}

function man {
  /usr/bin/man $* | col -bp | view -c 'set ft=man nomod nolist' -
}

function pastie {
  url=$(curl http://pastie.caboo.se/pastes/create \
    -H "Expect:" \
    -F "paste[parser]=plain_text" \
    -F "paste[body]=<-" \
    -F "paste[authorization]=burger" \
    -s -L -o /dev/null -w "%{url_effective}")
  echo -n "$url" | xclip
  echo "$url"
}

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:sudo:*' command-path $path
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:(^rm):*:*' ignored-pattern '*(.o|~)' '#*#(D)'

HISTSIZE=1024
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

chpwd
stty start undef stop undef

# vim: noet ft=zsh sw=2

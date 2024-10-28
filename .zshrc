#[ "$(tty)" = "/dev/tty1" ] && exec startx

PS1="%m:%~%(!.#.$) " 

export NO_COLOR=1
export BLOCKSIZE=1k
export LESS="-i"
export LESSHISTFILE=/dev/null
# export SSH_ASKPASS_REQUIRE=prefer
export WORDCHARS='*?_[]~=&;!#$%^(){}'

if [[ ! -o interactive ]]; then
   return
fi

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

alias cp="cp -i"
alias mv="mv -i"
alias hg="history | grep "
alias ls="ls -aF"
alias ll="ls -alF"
alias ph="ps auwwx | head"
alias pg="ps auwwx | grep -i -e ^USER -e "
alias k9="kill -9 %1"
alias pku="pkill -u -KILL $USER"
alias rg="rg --color=never -N -z"
alias suck="rm -f config.h && sudo make clean install"
alias forti="sudo openfortivpn -c /etc/openfortivpn/config -q"
alias dbeaver="docker run -d --name cloudbeaver --rm -ti -p 8080:8978 -v /var/cloudbeaver/workspace:/opt/cloudbeaver/workspace dbeaver/cloudbeaver:latest --restart unless-stopped"

if [ -x "`which vim`" ]; then
   alias vi="vim"
   alias view="vim -R"
   export EDITOR=`which vim`
else
   export EDITOR=/usr/bin/vi
fi

setopt noclobber
setopt nohup
setopt print_exit_value
TMOUT=0
unset HISTFILE
HISTSIZE=500

setopt ignore_eof
_block_quick_bail() {
   _sj=`jobs -sp`
   if [[ $_sj == "" ]]; then
      exit
   else
      _sj=$'\n'${_sj}
      zle -M "zsh: you have suspended jobs:${_sj}"
   fi
}
zle -N _block_quick_bail
bindkey '^d' _block_quick_bail

watch=all
WATCHFMT="%B%n%b %a %l at %@"

limit coredumpsize 0
umask 022

__git_files () {
    _wanted files expl 'local files' _files
}

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

function ff() {
    local file
    file=$(find . -type f | fzf --preview 'cat {}') && [ -n "$file" ] && vim "$file"
}

function fd() {
    local dir
    dir=$(find . -type d | fzf --preview 'cat {}') && cd "$dir"
}

function fh() {
    history | fzf --preview 'cat {}' | awk '{print $2}' | xargs -I {} zsh -c {}
}

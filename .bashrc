### ewall's .bashrc ###

## aliases are sold separately:
if [ -f "${HOME}/.bash_aliases" ]; then
    . "${HOME}/.bash_aliases"
fi

## support for Ruby Version Manager (rvm)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

## support for bash completion
# note: copy git-completion.bash into /etc/bash_completion for Git awareness
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

## preferences
export EDITOR=/usr/bin/nano
export VISUAL=/usr/bin/vim
export GIT_PS1_SHOWDIRTYSTATE=yes
export HISTCONTROL=ignoreboth

## prompt

# - simple uncolored git-aware prompt:
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# - add Git-aware to current prompt:
#if [ "\$(type -t __git_ps1)" ]; then
#    PS1="$PS1\$(__git_ps1 '(%s) ') "
#fi

# - msysGit's colored git-aware prompt:
#PS1='\[\033]0;$MSYSTEM:\w\007
#\033[32m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
#$ '

# - Linux Mint default
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]'

# - Mint + git-awareness
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[1;33m\]$(parse_git_branch) \[\033[00m\]\$ '

### ewall's .bashrc ###

## aliases are sold separately:
if [ -f "${HOME}/.bash_aliases" ]; then
    . "${HOME}/.bash_aliases"
fi

## for bash completion
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

# - simple uncolored Git-aware prompt:
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# - add Git-aware to current prompt:
#if [ "\$(type -t __git_ps1)" ]; then
#    PS1="$PS1\$(__git_ps1 '(%s) ') "
#fi

# - msysGit's colored Git-aware prompt:
#PS1='\[\033]0;$MSYSTEM:\w\007
#\033[32m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
#$ '
### ewall's .bashrc ###

# aliases are sold separately:
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# for bash completion
# copy git-completion.bash into /etc/bash_completion for Git awareness
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# preferences
export EDITOR=/usr/bin/nano
export VISUAL=/usr/bin/vim
export GIT_PS1_SHOWDIRTYSTATE=yes
export HISTCONTROL=ignoreboth

# prompt
# - use Ubuntu's pretty color prompt:
force_color_prompt=yes
# - simple uncolored Git-aware prompt:
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# - add Git-aware to current prompt:
#if [ "\$(type -t __git_ps1)" ]; then
#    PS1="$PS1\$(__git_ps1 '(%s) ') "
#fi

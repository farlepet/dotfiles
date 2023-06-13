#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/.gem/ruby/2.1.0/bin:/home/farlepet/.local/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/git/completion/git-prompt.sh

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#SSH_ENV="$HOME/.ssh/environment"

#function start_agent {
#    echo "Initialising new SSH agent..."
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add;
#}

# Source SSH settings, if applicable

#if [ -f "${SSH_ENV}" ]; then
#    . "${SSH_ENV}" > /dev/null
#    #ps ${SSH_AGENT_PID} doesn't work under cywgin
#    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi

[[ -f /usr/share/LS_COLORS/dircolors.sh ]] && \
    . /usr/share/LS_COLORS/dircolors.sh

PATH="${HOME}/perl5/bin${PATH+:}${PATH}:/home/farlepet/.gem/ruby/3.0.0/bin"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

CHROME_EXECUTABLE=/bin/google-chrome-stable; export CHROME_EXECUTABLE

export QT_QPA_PLATFORMTHEME=gtk2

export EDITOR=/usr/bin/vim


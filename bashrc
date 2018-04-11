# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.bashrc_local_before file
if [ -f ~/.bashrc_local_before ]; then
    source ~/.bashrc_local_before
fi

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.bash/prompt.bash

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export MONO_GAC_PREFIX=/usr/local

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LDFLAGS=-L/usr/local/opt/boost@1.60/lib
export CPPFLAGS=-I/usr/local/opt/boost@1.60/include

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.bashrc_local_after file
if [ -f ~/.bashrc_local_after ]; then
    source ~/.bashrc_local_after
fi
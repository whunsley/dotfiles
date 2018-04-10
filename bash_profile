# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
export MONO_GAC_PREFIX=/usr/local

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LDFLAGS=-L/usr/local/opt/boost@1.60/lib
export CPPFLAGS=-I/usr/local/opt/boost@1.60/include

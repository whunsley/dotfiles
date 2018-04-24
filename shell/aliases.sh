# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias ll='ls -alF'

# List all files colorized in long format, including dot files
alias la='ls -A'

# List only directories
alias lsd='ls -l | grep "^d"'

# some more ls aliases
alias l='ls -CF'

# shorten dotnet core command line.
alias dn='dotnet'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# function that will provide better output
# when searching for processes.
psgrep ()
{
    pattern=[^]]${1};
    case "$(uname -s)" in
        Darwin)
            ps -A -o pid,ppid,nice,pri,pcpu,pmem,etime,user,wchan,stat,command | grep -i -e "^[[:space:]]*PID" -e ${pattern}
        ;;
        Linux | AIX)
            ps -A -o pid,ppid,tid,nice,pri,pcpu,pmem,etime,user,wchan:20,stat,command | grep -i -e "^[[:space:]]*PID" -e ${pattern}
        ;;
        SunOS)
            ps -A -o pid,ppid,ctid,nice,pri,pcpu,pmem,etime,user,comm | grep -i -e "^[[:space:]]*PID" -e ${pattern}
        ;;
        *)  # other UNIX flavors get a minimalist version.
            ps -A | grep -i -e ${pattern}
        ;;
    esac
}

# Add language specific ag commands
alias lag='ag --lua'
alias cag='ag --cpp'

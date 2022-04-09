# .kshrc

# Various colors
# Note: "1;" appears as bold when using xterm. If you want the font thinner, use 0 (zero) instead.
PLAIN="\E[0m"
BLUE="\E[0;34m"
CYAN="\E[0;36m"
GREEN="\E[0;32m"
MAGENTA="\E[0;35m"
RED="\E[0;31m"
WHITE="\E[0;37m"
YELLOW="\E[0;33m"

# Set the Java home below if you have one
#export JAVA_HOME=/opt/jdk

# Path
if [ -z ${JAVA_HOME+x} ]; then
  export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
else
  export PATH="$JAVA_HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
fi

# Set the appearance of the shell prompt using the "set_prompt" function defined in the "Functions" section
PS1='`set_prompt`'

# Set DISPLAY appropriately if using an X server
#export DISPLAY=localhost:0.0

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Set the location and name of the history file
# The default is "~/.sh_history".
#export HISTFILE=~/.sh_history"

# Store up to this many lines in memory for the history of the current session
export HISTSIZE=1500

# Use less instead of more to navigate pages of data on the screen
export PAGER=less

# Uncomment the line below to disable terminal messaging from other users
#mesg n

# A reasonable umask (use 027 or 077 for increased security)
umask 027

# Disallow > operator on a file that already exists
# This is an additional layer of protection against accidental overwrites.
set -o noclobber

# Notify of job completion
set -o notify

# Uncomment the line below to remove all existing aliases and start fresh
#unalias -a
# Aliases
alias cd..="cd .."
alias cls="clear"
alias cp="cp -i"
alias cwd="pwd"
alias df="df -h"
alias ducks="du -cks * | sort -nr | less"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias free="free -h"
alias grep="grep --color=auto"
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias ln="ln -i"
alias ls="ls -F --color=auto"
alias md="mkdir"
alias more="less"
alias mv="mv -i"
alias rd="rmdir"
alias rm="rm -i"
alias tree="tree -C"
alias vi="vim"

# Functions
# Set the appearance of the shell prompt
set_prompt()
{
  retval="$?"
  date=`date +"%T"`
  uid=`id -u`
  host_name=`hostname | cut -d'.' -f1`

  # Change prompt based on the exit code of the last command
  if [[ "$retval" = 0 ]] then
    face="$GREEN:)$PLAIN"
  else
    face="$RED:($PLAIN"
  fi

  # Check effective UID and set trailing prompt character appropriately if user is root
  if [[ "$uid" -eq 0 ]]; then
    prompt_sigil="#"
  else
    prompt_sigil="$"
  fi

  # Set the current working directory and shorten it to '~' if in home directory
  if [[ "${PWD#$HOME}" != "$PWD" ]] then
    cwd="~${PWD#$HOME}"
  else
    cwd="$PWD"
  fi

  # Git repo status support (optional)
  # I chose git-prompt (requires Go) for portability, speed, and the visuals.
  # To obtain: git clone https://github.com/olemb/git-prompt
  # After building, copy the resulting binary to somewhere in your path such as /usr/local/bin or ~/bin.
  if [[ -x `command -v git-prompt` ]] then
    print -n "$WHITE<$YELLOW$date$WHITE> ($MAGENTA$cwd$WHITE) `git-prompt`\n[$CYAN`whoami`$WHITE@$CYAN$host_name$WHITE] $face $WHITE{$YELLOW"!"$WHITE}$prompt_sigil $PLAIN"
  else
    print -n "$WHITE<$YELLOW$date$WHITE> ($MAGENTA$cwd$WHITE)\n[$CYAN`whoami`$WHITE@$CYAN$host_name$WHITE] $face $WHITE{$YELLOW"!"$WHITE}$prompt_sigil $PLAIN"
  fi

  unset retval face date cwd uid prompt_sigil
}

# Print a hierarchical list of directories (if tree is not installed)
#tree()
#{
#  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
#}

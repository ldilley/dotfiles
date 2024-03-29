# .bashrc
# Lloyd Dilley
# https://github.com/ldilley/dotfiles

# Various colors
# Note: "1;" appears as bold when using xterm. If you want the font thinner, use 0 (zero) instead.
PLAIN="\[\033[0m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
WHITE="\[\033[0;37m\]"
YELLOW="\[\033[0;33m\]"

# Faces to signify exit status of the last command
SMILE="${GREEN}:)${PLAIN}"
FROWN="${RED}:(${PLAIN}"

# Set the Java home below if you have one
#export JAVA_HOME=/opt/jdk

# Path
if [ -z ${JAVA_HOME+x} ]; then
  export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
else
  export PATH="$JAVA_HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
fi

# Set appearance of the shell prompt
set_prompt()
{
  EXIT_STATUS=$?
  # Change prompt based on exit code of the last command
  #FACE="if [ \$? = 0 ]; then echo \"${SMILE}\"; else echo \"${FROWN}\"; fi"
  if [ $EXIT_STATUS = 0 ]; then
    export FACE=${SMILE}
  else
    export FACE=${FROWN}
  fi

  # Check effective UID and set trailing prompt character appropriately if user is root
  if [[ $EUID -eq 0 ]]; then
    export PROMPT_SIGIL="#"
  else
    export PROMPT_SIGIL="$"
  fi

  # Git repo status support (optional)
  # To obtain: git clone https://github.com/olemb/git-prompt
  # After building (go build git-prompt.go), copy the resulting binary to somewhere in your path such as /usr/local/bin or ~/bin.
  if [[ -x `command -v git-prompt` ]]; then
    export PS1="${WHITE}<${YELLOW}\t${WHITE}> (${MAGENTA}\w${WHITE}) \$(git-prompt)\n${WHITE}[${CYAN}\u${WHITE}@${CYAN}\h${WHITE}] ${FACE} ${WHITE}{${YELLOW}\!${WHITE}}${PROMPT_SIGIL} ${PLAIN}"
  else
    export PS1="${WHITE}<${YELLOW}\t${WHITE}> (${MAGENTA}\w${WHITE})\n${WHITE}[${CYAN}\u${WHITE}@${CYAN}\h${WHITE}] ${FACE} ${WHITE}{${YELLOW}\!${WHITE}}${PROMPT_SIGIL} ${PLAIN}"
  fi

  # Append each command to the history file after it is entered
  history -a
}

# Set to function that dynamically updates the shell prompt
PROMPT_COMMAND=set_prompt

# Terminal type
export TERM=xterm-256color

# Set DISPLAY appropriately if using an X server
#export DISPLAY=localhost:0.0

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Set location and name of the history file
# The default is: ~/.bash_history
#export HISTFILE=~/.bash_history

# Do not include commands followed by spaces or repeated commands in the history
export HISTCONTROL=ignoreboth

# Store up to this many lines in the history file
export HISTFILESIZE=10000

# Do not save the defined commands in the history file
# Example: "df*:free*:ls*"
export HISTIGNORE=

# Store up to this many lines in memory for the history of the current session
export HISTSIZE=1500

# Use timestamps in the history
export HISTTIMEFORMAT="%m/%d/%Y (%a) %H:%M:%S - "

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

# Check if command exists in hash table prior to execution, else attempt to find it on disk
shopt -s checkhash

# Update columns and rows depending on terminal window width
shopt -s checkwinsize

# Save multi-line commands as a single entry to make editing easier
shopt -s cmdhist

# Enable extended pattern matching
shopt -s extglob

# After shell exit, append the history from memory to the history file
shopt -s histappend

# Allow modification of a failed history substitution
shopt -s histreedit

# Allow review of a history substitution prior to execution
shopt -s histverify

# Complete hostnames
shopt -s hostcomplete

# Save multi-line commands with embedded newlines rather than semi-colons
shopt -s lithist

# Do not attempt to auto-complete empty input
shopt -s no_empty_cmd_completion

# Enable programmable completion
shopt -s progcomp

# Set backspace as erase key
stty erase '^?'

# Enable color support for BSD and macOS if TERM supports it
export CLICOLOR=1

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
alias la="ls -laF --color=auto"
alias ll="ls -lF --color=auto"
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
# Print a hierarchical list of directories (if tree is not installed)
#tree()
#{
#  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
#}

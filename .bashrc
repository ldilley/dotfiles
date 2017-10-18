# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Various colors
# Note: "1;" appears as bold when using xterm. If you want the font thinner, use 0 (zero) instead.
PLAIN="\[\033[0m\]"
BLUE="\[\033[1;34m\]"
CYAN="\[\033[1;36m\]"
GREEN="\[\033[1;32m\]"
MAGENTA="\[\033[1;35m\]"
RED="\[\033[1;31m\]"
WHITE="\[\033[1;37m\]"
YELLOW="\[\033[1;33m\]"

# Change prompt based on the exit code of the last command
SMILE="${GREEN}:)${PLAIN}"
FROWN="${RED}:(${PLAIN}"
FACE="if [ \$? = 0 ]; then echo \"${SMILE}\"; else echo \"${FROWN}\"; fi"

# Git completion and repo status support
# Download these from:
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# Rename them to .git-completion.bash and .git-prompt.sh
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  # Set the appearance of the shell prompt
  PS1="${WHITE}<${YELLOW}\t${WHITE}>\$(__git_ps1 \" (%s)\") (${MAGENTA}\w${WHITE})\n${WHITE}[${CYAN}\u${WHITE}@${CYAN}\h${WHITE}] \`${FACE}\` ${WHITE}{${BLUE}\!${WHITE}}$ ${PLAIN}"
else
  PS1="${WHITE}<${YELLOW}\t${WHITE}> (${MAGENTA}\w${WHITE})\n${WHITE}[${CYAN}\u${WHITE}@${CYAN}\h${WHITE}] \`${FACE}\` ${WHITE}{${BLUE}\!${WHITE}}$ ${PLAIN}"
fi

# Set the Java home below if you have one
#export JAVA_HOME=/opt/jdk

# Path
if [ -z ${JAVA_HOME+x} ]; then
  PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH:~/bin"
else
  PATH="$JAVA_HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH:~/bin"
fi
export PATH

# Set DISPLAY appropriately if using an X server
#export DISPLAY=localhost:0.0

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Do not include commands followed by spaces or repeated commands in the history
export HISTCONTROL=ignoreboth

# Store up to this many lines in .bash_history
export HISTFILESIZE=10000

# Do not save the defined commands in .bash_history
# Example: "df*:free*:ls*"
export HISTIGNORE=

# Store up to this many lines in memory for the history of the current session
export HISTSIZE=1500

# Use timestamps in the history
export HISTTIMEFORMAT="%D %T - "

# Use less instead of more to navigate pages of data on the screen
export PAGER=less

# Uncomment the line below to disable terminal messaging from other users
#mesg n

# A reasonable umask (use 077 for increased security)
umask 022

# Append each command to .bash_history after it is entered
PROMPT_COMMAND="history -a"

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

# After shell exit, append the history from memory to .bash_history
shopt -s histappend

# Allow the modification of a failed history substitution
shopt -s histreedit

# Allow the review of a history substitution prior to execution
shopt -s histverify

# Complete hostnames
shopt -s hostcomplete

# Save multi-line commands with embedded newlines rather than semi-colons
shopt -s lithist

# Do not attempt to auto-complete empty input
shopt -s no_empty_cmd_completion

# Enable programmable completion
shopt -s progcomp

# Uncomment the line below to remove all existing aliases and start fresh
#unalias -a
# Aliases
alias cd..="cd .."
alias cls="clear"
alias commit="git add . && git commit -a -m "
alias cp="cp -i"
alias cwd="pwd"
alias df="df -h"
alias ducks="du -cks * | sort -nr | less"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias free="free -h"
alias gpom="git push origin master"
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
alias vi="vim"

# Functions
# Print a hierarchical list of directories
tree()
{
  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

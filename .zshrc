# .zshrc

# Set the Java home below if you have one
#export JAVA_HOME=/opt/jdk

# Path
if [ -z ${JAVA_HOME+x} ]; then
  export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
else
  export PATH="$JAVA_HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
fi

# Git repo status support (optional)
# I chose git-prompt (requires Go) for portability, speed, and the visuals.
# To obtain: git clone https://github.com/olemb/git-prompt
# After building, copy the resulting binary to somewhere in your path such as /usr/local/bin or ~/bin.
if [[ -x `command -v git-prompt` ]]; then
  # Allow variable expansion in the shell prompt
  setopt prompt_subst
  # Set the appearance of the shell prompt
  PROMPT=$'%B<%F{yellow}%*%f> (%F{magenta}%1~%f%) `git-prompt`
[%F{cyan}%n%f@%F{cyan}%m%f] %(?,%F{green}:%)%f,%F{red}:(%f) {%F{blue}%!%f}%#%b '
else
  PROMPT='%B<%F{yellow}%*%f> (%F{magenta}%1~%f%)
[%F{cyan}%n%f@%F{cyan}%m%f] %(?,%F{green}:%)%f,%F{red}:(%f) {%F{blue}%!%f}%#%b '
fi

# Set DISPLAY appropriately if using an X server
#export DISPLAY=localhost:0.0

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Set the location and name of the history file
HISTFILE=~/.histfile

# Store up to this many lines in memory for the history of the current session
HISTSIZE=1500

# Store up to this many lines in the history file
SAVEHIST=10000

# Use less instead of more to navigate pages of data on the screen
export PAGER=less

# Uncomment the line below to disable terminal messaging from other users
#mesg n

# A reasonable umask (use 077 for increased security)
umask 022

# Append to the history file rather than create a new one
setopt appendhistory

# Traverse directories without the use of "cd"
setopt autocd

# Detect and attempt to correct erroneous input
setopt correct

# Similar to "correct" above, but also handles arguments
#setopt correctall

# Enable extended pattern matching
setopt extendedglob

# If the previous command is the same as the current one, do not add it to the history
setopt histignoredups

# Do not include commands followed by spaces in the history
setopt histignorespace

# Append each command to the history file after it is entered
setopt incappendhistory

# Disallow > operator on a file that already exists
# This is an additional layer of protection against accidental overwrites.
setopt noclobber

# Print an error if no match is found while globbing
setopt nomatch

# Immediately report the status of background jobs
setopt notify

# Disable the bell
#unsetopt beep

# Use vi mode in the zsh line editor (-e for emacs)
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Uncomment the line below to remove all existing aliases and start fresh
#unalias -m '*'
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
alias history="history -t \"%m/%d/%Y %T\""
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

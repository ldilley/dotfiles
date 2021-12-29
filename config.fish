# ~/.config/fish/config.fish

# Set the Java home below if you have one
#set -gx JAVA_HOME /opt/jdk

# Path (ignore warnings for non-existent directories by redirecting stderr)
if test -n "$JAVA_HOME"
  set -gx PATH $JAVA_HOME/bin /opt/local/bin /opt/local/sbin /usr/local/bin /usr/local/sbin $HOME/bin $PATH ^/dev/null
else
  set -gx PATH /opt/local/bin /opt/local/sbin /usr/local/bin /usr/local/sbin $HOME/bin $PATH ^/dev/null
end

# Set DISPLAY appropriately if using an X server
#set -gx DISPLAY localhost:0.0

# Set default web browser
set -gx BROWSER elinks

# Set default editor
set -gx EDITOR vim
set -gx VISUAL vim

# Use less instead of more to navigate pages of data on the screen
set -gx PAGER less

# Uncomment the line below to disable terminal messaging from other users
#mesg n

# A reasonable umask (use 027 or 077 for increased security)
umask 027

# Various colors
set -g plain (set_color normal)
set -g blue (set_color 0000ff)
set -g cyan (set_color 00ffff)
set -g green (set_color 00ff00)
set -g magenta (set_color ff00ff)
set -g red (set_color ff0000)
set -g white (set_color ffffff)
set -g yellow (set_color ffff00)

# Discard domain portion of hostname if included
set -x HOSTNAME (hostname | string split '.')[1]

# Nullify the welcome message
set fish_greeting

# Configure the git prompt
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showstashstate true
set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_showupstream auto
set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_color_branch ffa500
set __fish_git_prompt_color_cleanstate 00ff00
set __fish_git_prompt_color_dirtystate ff0000
set __fish_git_prompt_color_invalidstate ff0000
set __fish_git_prompt_color_stagedstate ffff00
set __fish_git_prompt_color_untrackedfiles 0000ff
set __fish_git_prompt_color_prefix ffffff
set __fish_git_prompt_color_suffix ffffff

# Set the appearance of the shell prompt
function fish_prompt
  # Save the return code from the last command
  set -l retval $status

  # Shorten the current working directory to '~' if in home directory
  set -l cwd (pwd)
  if [ $cwd = $HOME ]
    set cwd "~"
  end

  # Change prompt based on the exit code contained in $retval
  set -l face $green":)"
  if [ $retval != 0 ]
    set face $red":("
  end

  printf $white"<"$yellow(date +"%T")$white"> ("$magenta$cwd$white")"$plain%s\n (__fish_git_prompt)
  echo -n $white"["$cyan$USER$white"@"$cyan$HOSTNAME$white"] "
  echo -n $face
  echo $white" > "$plain
end

# Set the appearance of the right-side prompt
#function fish_right_prompt
#  echo (__fish_git_prompt)
#end

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
alias vi="vim"

# Custom functions

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# # # # don't put duplicate lines or lines starting with space in the history.
# # erasedups: causes all previous lines matching the current line to be removed from the history list before that line is saved
# # ignorespaces: ignore commands starting with a space
# # ignoredups: ignore dupe commands
HISTCONTROL='erasedups:ignoreboth'
HISTIGNORE='ls:ll:pwd:exit:su:clear:reboot:history:bg:fg'
PROMPT_COMMAND='history -a; history -c; history -r'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# no limit
HISTSIZE=-1
# no limit
HISTFILESIZE=-1
HISTTIMEFORMAT='%F %T '
HISTFILE="${HOME}/.bash_history"

# # # # shopt options
# # https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# # https://ss64.com/bash/shopt.html
# history list is appended to the history file when the shell exits
shopt -s histappend
# check terminal window size after each command, updates LINES and COLUMNS
shopt -s checkwinsize
# command name that is the name of a directory is executed as if it were the argument to the cd command
shopt -s autocd
# argument to the cd command that is not a directory is assumed to be the name of a variable whose value is the directory to change to
shopt -s cdable_vars
# minor errors in the spelling of a directory component in a cd command will be corrected
shopt -s cdspell
# bash matches filenames in a case-insensitive fashion when performing filename expansion
shopt -s nocaseglob

# set vi style
set -o vi
# No overwriting with 'input' > 'output' if output exists
# # Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files
set -o noclobber

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# # # # enable programmable completion features (you don't need to enable
# # # # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # # # sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# export EDITOR="emacsclient -c"
# export PASSWORD_STORE_DIR=~/.pass

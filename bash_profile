# customize bash prompt
__git_ps1()
{ 
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
  printf "$1" "${b##refs/heads/}";
  fi
}
export PS1='\[\e[0;95m\]In \w:\n\[\e[0;37m\]\D{%a %b %e %r}\[\e[0m\] \[\e[0;96m\]\u\[\e[0;91m\]@\h\[\e[0m\] \[\e[1;95m\]\W\[\e[0m\] $(__git_ps1 "(\[\e[1;33m\]%s\[\e[m\])") \[\e[1;33m\]\$\[\e[0m\] '
function gtree { git log "$@" --graph --full-history --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"; }
function gtree2 { git log $1 --not $( git show-ref --heads | cut -d' ' -f2 | grep -v "^$1" ) --graph --full-history --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"; }

# make sure tmux works correctly
alias tmux="TERM=xterm-256color tmux"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# set timezone                                                                                                           
TZ='America/Los_Angeles'; export TZ                                                                                      

# run bashrc                                                                                                             
if [ -f ~/.bashrc ]; then                                                                                                
   source ~/.bashrc                                                                                                      
fi 

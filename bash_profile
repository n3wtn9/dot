# make sure tmux works correctly
alias tmux="TERM=xterm-256color tmux"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# set timezone                                                                                                           
TZ='America/Los_Angeles'; export TZ                                                                                      

alias gl='git log --oneline --graph --decorate --all'

# sort by time reverse
alias ll='ls -lFGhHtr'

# run bashrc                                                                                                             
if [ -f ~/.bashrc ]; then                                                                                                
   source ~/.bashrc                                                                                                      
fi 

# compare change in branch from a common ancestry
# $1 base, $2 branch
gitcompare() {
  git diff --name-only $2  $(git merge-base $1 $2)
}

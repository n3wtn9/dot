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

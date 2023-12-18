neofetch | lolcat

# Simulate xterm via ssh
alias ssh="TERM=xterm-256color ssh"

# Env variables & dev
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export NODATE_HOME="$HOME/STM32/Nodate"

alias pip="pip3" 
alias get_idf='. $HOME/esp/esp-idf/export.sh'

# zsh plugins
source $HOMEBREW_PREFIX/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

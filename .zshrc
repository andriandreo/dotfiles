# Replicate zsh prompt behaviour with CWD (Current Working Directory)
export PS1='%n@%m %1~ %# '

# Fetch & lolcat
neofetch | lolcat

# zsh plugins & dev
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# paru: pacman helper
alias yay="paru"

# Server SSH shortcut
# alias server="ssh server.lan"

# exa: a modern replacement for ls
alias ls="exa"
alias lt="exa --tree"
alias la="exa -la"

# bat: a cat clone with wings
alias cat="bat"

# rsync: no cp anymore
alias cp="rsync -a --info=progress2"

# Run ifconfig to get IP if needed
sleep 7 # Wait for a few seconds
ifconfig

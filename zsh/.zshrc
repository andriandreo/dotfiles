#eval "$(starship init zsh)"

# export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket

# Autostart odrive/BoxSync agent
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then  
  nohup "$HOME/.odrive-agent/bin/odriveagent" > /dev/null 2>&1 &
fi
alias odrive="$HOME/.odrive-agent/bin/odrive"

# Automatically start sway

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  export NO_AT_BRIDGE=1
  export MOZ_ENABLE_WAYLAND=true
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_QPA_PLATFORMTHEME=qt5ct
  export QT_FONT_DPI=96
  eval $(gnome-keyring-daemon --start)
  # export SSH_AUTH_SOCK
  # export MOZ_DBUS_REMOTE=1 
  exec sway -D noatomic
fi

# Fetch & lolcat
freshfetch | lolcat

# Simulate xterm via ssh
# alias ssh="TERM=xterm-256color ssh"

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Paru: Pacman Helper
alias yay="paru"

# Server SSH shortcut
# alias server="ssh server.lan"

# exa: A modern replacement for ls
alias ls="exa"
alias lt="exa --tree"
alias la="exa -la"

# bat: a cat clone with wings
alias cat="bat"

# rsync: Not cp anymore
alias cp="rsync -a --info=progress2"



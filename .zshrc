# ==============================================================================
# 0. BASE SYSTEM CONFIGURATION (GRML)
# ==============================================================================
# Load the Arch-managed Grml baseline config if it exists
[ -f /etc/zsh/zshrc ] && source /etc/zsh/zshrc

# ==============================================================================
# 1. ENVIRONMENT VARIABLES & PATHS
# ==============================================================================
export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket    # Reduce auth frequency in SSH | AUTH SOCKET
export PATH=$PATH:$HOME/.local/bin                      # Local user binaries

# Fix color profile compatibility over remote SSH sessions
alias ssh="TERM=xterm-256color ssh"

# ==============================================================================
# 2. SHELL OPTIONS & HISTORY CONFIGURATION
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY      # Share history instantly across windows
setopt HIST_IGNORE_DUPS   # Don't record consecutive duplicate commands
setopt HIST_FCNTL_LOCK    # Prevent history file corruption

# ==============================================================================
# 3. EXTERNAL PLUGINS & MODERN PROMPT (IF pkg exists | `if`/`&&`)
# ==============================================================================
# Load Arch-managed zsh extensions
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions approach
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"   # Dark gray suggestions
# export ZSH_AUTOSUGGEST_STRATEGY=(history)       # Only suggest based on history

# ==============================================================================
# 4. COMPLETIONS & NAVIGATION SETTINGS
# ==============================================================================
# Initialize zsh Advanced Completion (Run after plugins are loaded)
autoload -Uz compinit && compinit   # Unalias forcing zsh syntax while loading

# Safe completion and layout preferences
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # (Upper/Lower)-Case insensitive
zstyle ':completion:*' menu select                          # Visual arrow-key menu

# Arrow keys search past commands starting with what you've already typed
autoload -U up-line-or-beginning-search down-line-or-beginning-search       # Smart history navigation widgets (unaliased)
zle -N up-line-or-beginning-search; zle -N down-line-or-beginning-search    # Widgets within the zsh Line Editor (ZLE)
## Actual key-bindings
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Standard desktop cursor navigation definitions
bindkey '\e[1;5C' forward-word          # Ctrl + Right
bindkey '\e[1;5D' backward-word         # Ctrl + Left
bindkey '\e[3;5~' kill-word             # Ctrl + Delete
bindkey '^H' backward-kill-word         # Ctrl + Backspace
bindkey '\e[3;6~' kill-line             # Ctrl + Shift + Delete
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line              # End
bindkey '^[[3~' delete-char             # Delete

# ==============================================================================
# 5. ALIASES
# ==============================================================================
alias yay="sudo pacman" # NOTE. This is NOT HOW `yay`/`paru` WORK AT ALL AND SHOULD BE AVOIDED unless min. setup is required and you know what you're doing (!)
# alias k=kubectl
# alias server="ssh server.lan"

# Modern terminal alternatives
alias ls="eza --group-directories-first"
alias lt="eza --tree --level=2"
alias la="eza -la --git --header --group-directories-first"

alias cp="rsync -a --info=progress2"
alias cat="bat"

# Dynamic system completions loaded on demand (If tools exist)
command -v kubectl &> /dev/null && source <(kubectl completion zsh)

# TRAMP Support | SSH (Disables fancy prompt if accessed via bg code editors: vscode, emacs, neovim,...)
if [ "$TERM" = "dumb" ]; then
    unsetopt zle prompt_cr prompt_subst # Disable ZLE
    unset RPS1 RPROMPT                  # Unsets right-hand side prompts
    # Simple `$ ` prompt
    PS1='$ '
    PROMPT='$ '
fi

# ==============================================================================
# 6. FETCH | LOLCAT (STARTUP SCRIPT)
# ==============================================================================
if [ "$TERM" != "dumb" ] && command -v fastfetch &> /dev/null && command -v lolcat &> /dev/null; then
    fastfetch | lolcat
fi

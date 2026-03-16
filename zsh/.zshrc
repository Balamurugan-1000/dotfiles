# -----------------------
# PATH configuration
# -----------------------

# user binaries
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# go binaries (if you use go install)
export PATH="$HOME/go/bin:$PATH"

# cargo (rust)
export PATH="$HOME/.cargo/bin:$PATH"

# python user installs
export PATH="$HOME/.local/share/pipx/venvs:$PATH"

# custom builds (optional)
export PATH="$HOME/.local/builds:$PATH"


# -----------------------
# history
# -----------------------

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt appendhistory
setopt sharehistory


# -----------------------
# completion
# -----------------------

autoload -Uz compinit
compinit


# -----------------------
# aliases
# -----------------------

alias ls="eza --icons"
alias ll="eza -la --icons"
alias cat="bat"
alias grep="rg"


# -----------------------
# tools
# -----------------------

# zoxide smart cd
eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# -----------------------
# plugins
# -----------------------

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# -----------------------
# prompt
# -----------------------

eval "$(starship init zsh)"

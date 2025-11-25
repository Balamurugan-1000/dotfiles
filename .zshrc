### === Preserve system PATH first === ###
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

### === Oh My Zsh === ###
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

### === Aliases === ###
alias cls='clear'
alias c='clear'
alias ls='eza --icons'
alias cat='bat'
alias runhttps='python manage.py runserver_plus --cert-file cert.crt'
alias gs='git status'
alias cgrep='grep --color=always'

### === Neovim Profiles === ###
alias chad='NVIM_APPNAME="chad" nvim'
alias astro='NVIM_APPNAME="astro" nvim'
alias lazy='NVIM_APPNAME="lazyvim" nvim'
alias kick='NVIM_APPNAME="kick" nvim'
alias code='code-insiders'

### === Editors === ###
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='vim'

### === Homebrew === ###
export PATH="/opt/homebrew/bin:$PATH"
export PATH=/Users/bala/.local/bin:$PATH
### === Python & pyenv === ###
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

### === Virtualenvwrapper === ###
export WORKON_HOME="$HOME/workspace/"
[[ -f "$PYENV_ROOT/versions/3.8.18/bin/virtualenvwrapper.sh" ]] && \
    source "$PYENV_ROOT/versions/3.8.18/bin/virtualenvwrapper.sh"

### === Databases === ###
export DATABASE_NAME="testpress"
export DATABASE_USER="testpress"
export DATABASE_USER_PASSWORD="testpress1$"

### === Libraries === ###
# export LDFLAGS="-L/usr/local/opt/libffi/lib"
# export CPPFLAGS="-I/usr/local/opt/libffi/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

export LDFLAGS="-L$(brew --prefix libffi)/lib -L$(brew --prefix openssl@3)/lib"
export CPPFLAGS="-I$(brew --prefix libffi)/include -I$(brew --prefix openssl@3)/include"
export PKG_CONFIG_PATH="$(brew --prefix libffi)/lib/pkgconfig:$(brew --prefix openssl@3)/lib/pkgconfig"

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl@3/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@3/lib/pkgconfig"

export PATH="/usr/local/opt/postgresql@14/bin:/opt/homebrew/opt/postgresql@14/bin:/usr/local/opt/libpq/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
alias pgstart='postgres -D /usr/local/var/postgresql@14'


# Added by Antigravity
export PATH="/Users/bala/.antigravity/antigravity/bin:$PATH"
eval "$(starship init zsh)"

### === FZF === ###
# Ensure fzf is on PATH
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Improved preview UX using bat
export FZF_DEFAULT_OPTS="
  --height 80%
  --layout=reverse
  --border
  --preview 'bat --style=numbers --color=always --line-range=:200 {}'
  --preview-window=right:60%
"

# Keybindings (if installed via brew)
if [[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

# Completions
if [[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]]; then
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi

# Custom binding: search & cd into directory
fzf_cd() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git | fzf) && cd "$dir"
}
bindkey -s '^f' 'fzf_cd\n'

export APPLE_APP_SPECIFIC_PASSWORD="camd-jclp-kvyr-pyga"
export APPLE_ID="testpress.in@gmail.com"
export APPLE_TEAM_ID="BHAB7LC35Y"


# Load fzf if installed
 if [[ -f ~/.fzf.zsh ]]; then
   source ~/.fzf.zsh
   fi

   # Default fzf options
   export FZF_DEFAULT_OPTS="
     --height 80%
       --layout=reverse
         --border
           --info=inline
           "

           # Ripgrep + fzf file search
           f() {
             rg --files --hidden --glob '!.git/*' 2>/dev/null | fzf --preview "bat --color=always --line-range=:500 {}"
             }

             # Live search through command history
             fh() {
               print -z $(fc -l 1 | fzf --tac | sed 's/ *[0-9]* *//')
               }


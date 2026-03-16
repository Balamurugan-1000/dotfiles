if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/config.fish

set -gx EDITOR nvim
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.config/emacs/bin $PATH

# Starship prompt
starship init fish | source

# Add your aliases
alias lg='lazygit'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias c='clear'
alias vi='nvim'
alias ls='eza --icons'

set -U fish_color_command green
set -U fish_color_param cyan
set -U fish_color_quote yellow
set -U fish_color_redirection magenta
set -U fish_color_comment brgray
set -U fish_color_error red
set -U fish_color_end brblue
set -U fish_color_operator blue
set -U fish_color_escape brcyan
set -U fish_color_autosuggestion brblack
set -g fish_key_bindings fish_vi_key_bindings
set -gx PATH $PATH $HOME/go/bin


if status is-interactive
  zoxide init fish | source

    fzf --fish | source
end

# virtualenvwrapper + fish

direnv hook fish | source

#fastfetch

# opencode
fish_add_path /home/kaizen/.opencode/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

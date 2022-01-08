# VARIABLES
set -x DOTFILES $HOME/dotfiles
set -x EDITOR "nvim"

# ABBREVIATIONS
abbr e $EDITOR
abbr rel exec $SHELL
abbr lg lazygit
abbr ll exa -al
abbr work tmux new-session -A -s work
abbr a asdf

# ALIASES
alias j="z"

# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $DOTFILES/bin

# PROMPT
starship init fish | source

# LOAD ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# NO GREETING
function fish_greeting; end

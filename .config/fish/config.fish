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
abbr b bat

# ALIASES
# ...

# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $DOTFILES/bin
fish_add_path /opt/homebrew/opt/postgresql@12/bin

# PROMPT
starship init fish | source

# LOAD ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# NO GREETING
function fish_greeting; end

# LOAD JUMP
status --is-interactive; and source (jump shell fish | psub)

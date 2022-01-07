# VARIABLES
set -x EDITOR "nvim"

# ABBREVIATIONS
abbr e $EDITOR
abbr rel exec $SHELL
abbr lg lazygit
abbr ll exa -al
abbr work tmux new-session -A -s work

# ALIASES
alias j="z"

# PATH
fish_add_path /opt/homebrew/bin

# PROMPT
starship init fish | source


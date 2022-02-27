# NO GREETING
function fish_greeting; end

# VARIABLES
set -x DOTFILES $HOME/dotfiles
set -x EDITOR "nvim"
set -x GOPATH $HOME/go
set -x CARGOPATH $HOME/.cargo

# ABBREVIATIONS
abbr e $EDITOR
abbr rel exec $SHELL
abbr lg lazygit
abbr ll exa -al
abbr work tmux new-session -A -s work
abbr play tmux new-session -A -s play
abbr a asdf
abbr b bat
abbr dev ./scripts/dev

# ALIASES
# ...

# PATH
fish_add_path $DOTFILES/bin
fish_add_path $GOPATH/bin
fish_add_path $CARGOPATH/bin

# PLATFORM SPECIFIC
switch (uname)
  case Linux
    source ~/.asdf/asdf.fish
  case Darwin
    source /opt/homebrew/opt/asdf/libexec/asdf.fish

    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/postgresql@12/bin
end

# PROMPT
starship init fish | source

# LOAD JUMP
status --is-interactive; and source (jump shell fish | psub)

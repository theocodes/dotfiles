# prompt
starship init fish | source

# load asdf stuff
source (brew --prefix asdf)/asdf.fish

# remove greeting
set -U fish_greeting

alias j z

abbr vim nvim
abbr work tmux new-session -A -s work
abbr rel exec $SHELL
abbr ll exa -al
abbr b bat
abbr t tldr
abbr lg lazygit

# adding stuff to $PATH (the fish way)
set -U fish_user_paths ~/dotfiles/bin $fish_user_paths
set -U fish_user_paths ~/.cargo/bin $fish_user_paths
set -U fish_user_paths /usr/local/opt/llvm@12/bin $fish_user_paths


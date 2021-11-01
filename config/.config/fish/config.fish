# load nix
fenv source ~/.nix-profile/etc/profile.d/nix.sh

# prompt
starship init fish | source

# load asdf stuff
# source (brew --prefix asdf)/asdf.fish

# direnv hook fish | source

# remove greeting
set -U fish_greeting

alias j z

abbr vim nvim
abbr work tmux new-session -A -s work
abbr rel exec $SHELL
abbr ll exa -al

# adding stuff to $PATH (the fish way)
set -U fish_user_paths ~/dotfiles/bin

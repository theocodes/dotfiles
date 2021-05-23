# no greeting
function fish_greeting; end

# prompt
starship init fish | source

# virtual per-project environment
direnv hook fish | source

# local vars
set EDITOR "emacsclient -t"
set ALTERNATE_EDITOR ""
set EDITOR "emacsclient -c"
set GOSUMDB "off"

# global
set -gx FABPATH $HOME/repos/github.com/zencoder

# path
set -gx PATH $HOME/dotfiles/scripts $PATH
set -gx PATH $HOME/repos/github.com/zencoder/bolt-utils/bin $PATH

# aliases

alias ll="exa -la"

# abbr

abbr tree exa -la -T
abbr rel 'exec $SHELL -l'

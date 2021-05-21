# prompt
starship init fish | source

# virtual per-project environment
direnv hook fish | source

# vars
set EDITOR "emacsclient -t"
set FAB $HOME/repos/github.com/zencoder
set ALTERNATE_EDITOR ""
set EDITOR "emacsclient -c"
set GOSUMDB "off"

# path
set -gx PATH $HOME/.dotfiles/bin $PATH

# aliases
if type -q exa
    alias ll="exa -l -g --icons"
    alias l="ll"
    alias lla="ll -a"
end

# abbr

abbr rel 'exec $SHELL -l'

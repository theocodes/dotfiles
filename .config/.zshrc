# prompt
eval "$(starship init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias a="asdf"
alias e="$EDITOR"
alias ll="exa -al"
alias b="bat"
alias rel="exec $SHELL"
alias ..="cd .."
alias lg="lazygit"
alias j="z"
alias work="tmux new-session -A -s work"

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# move with alt-[Left/Right]Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source $HOME/.config/zsh/helpers.zsh
source $HOME/.config/zsh/plugins.zsh

# enable autocomplete
autoload -Uz compinit && compinit

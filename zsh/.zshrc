# prompt
eval "$(starship init zsh)"

source /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/opt/postgresql@12/bin

alias a="asdf"
alias e="$EDITOR"
alias ll="exa -al"
alias b="bat"
alias rel="exec $SHELL"
alias ..="cd .."
alias lg="lazygit"
alias j="z"
alias work="tmux new-session -A -s work"
alias play="tmux new-session -A -s play"
alias be="bundle exec"

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# move with alt-[Left/Right]Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^f" vi-end-of-line

source $HOME/.config/zsh/helpers.zsh
source $HOME/.config/zsh/plugins.zsh

# enable autocomplete
autoload -Uz compinit && compinit

# enable fzf goodness
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

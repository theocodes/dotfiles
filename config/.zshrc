# prompt
eval "$(starship init zsh)"

# load asdf
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

alias ll="ls -lahG"
alias vim="nvim"
alias rel="exec $SHELL"
alias ..="cd .."
alias lg="lazygit"
alias j="z"
alias work="tmux new-session -A -s work"

# move with alt-[Left/Right]Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export PATH=$PATH:$HOME/dotfiles/bin

source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/plugins.zsh

# enable autocomplete
autoload -Uz compinit && compinit
if [ -e /Users/theocodes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/theocodes/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

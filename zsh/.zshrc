# prompt
eval "$(starship init zsh)"

source /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/opt/postgresql@12/bin
export PATH=$PATH:$HOME/dotfiles/bin

# use ripgrep for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 50% --ansi'


alias a="asdf"
alias e="$EDITOR"
alias ll="exa -al"
alias b="bat"
alias rel="exec $SHELL"
alias ..="cd .."
alias lg="lazygit"
alias j="z"
alias work="tmux new-session -A -s WORK"
alias play="tmux new-session -A -s PLAY"
alias be="bundle exec"
alias n="notes"
alias nt="notes today"

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# move with alt-[Left/Right]Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^f" vi-end-of-line

# enable autocomplete
autoload -Uz compinit && compinit

source $HOME/.config/zsh/helpers.zsh
source $HOME/.config/zsh/plugins.zsh

# enable fzf goodness
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

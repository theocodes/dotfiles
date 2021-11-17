# prompt
eval "$(starship init zsh)"

# load direnv
eval "$(direnv hook zsh)"

# proper colors
export TERM=xterm-256color

# load asdf
if [[ "$(uname)" = "Linux" ]]; then
  . $HOME/.asdf/asdf.sh
else
  . $(brew --prefix)/opt/asdf/libexec/asdf.sh
fi

alias ll="exa -al"
alias vim="nvim"
alias rel="exec $SHELL"
alias ..="cd .."
alias lg="lazygit"
alias j="z"
alias work="tmux new-session -A -s work"
alias a='asdf'
alias b='bat'

# move with alt-[Left/Right]Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:$HOME/.asdf/installs/rust/nightly/bin
export PATH=$PATH:/usr/local/opt/llvm@12/bin
export PATH=$PATH:$GOPATH/bin
# export LLVM_SYS_120_PREFIX=/usr/local/opt/llvm@12

source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/plugins.zsh

# history setup
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# enable autocomplete
autoload -Uz compinit && compinit

# pulling the hair out
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$HOME/openssl --with-libyaml-dir=$(brew --prefix libyaml)"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"


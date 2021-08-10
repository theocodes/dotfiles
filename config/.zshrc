
typeset -U path cdpath fpath manpath

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# Aliases
alias e='emacsclient -c -n'
alias ll='ls -lahG --color=auto'
alias please='sudo $(fc -ln -1)'
alias rel='exec $SHELL -l'
alias vim='nvim'

# path

export PATH=$HOME/dotfiles/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/repos/github.com/zencoder/bolt-utils/bin:$PATH

# vars

export ALTERNATE_EDITOR="";
export EDITOR="emacsclient -c";
export GOSUMDB="off";
export FABPATH="$HOME/repos/github.com/zencoder";

HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
setopt autocd

signin () {
  echo ">> authenticating secrets provider"
  eval $(secrets signin)
}

setenv () {
  eval "setenv_$1 $2"
}

setenv_bolt () {
  signin

  export QUAY_ACCESS_TOKEN=$(secrets get quay_access_token)
  export CIRCLE_TOKEN=$(secrets get circle_token)
  export GITHUB_TOKEN=$(secrets get github_token)
}

setenv_aws () {
  FILE="$HOME/.aws/cli/cache/$1.json"
  STS='{}'
  if [ -f "$FILE" ]; then
      STS=$(cat "$FILE")
      AWS_SESSION_TOKEN=$(echo "$STS" | jq -r '.Credentials.SessionToken // 1')
      export AWS_SESSION_TOKEN
  else
      unset AWS_SESSION_TOKEN
      echo "unset aws session token"
  fi
  AWS_ACCESS_KEY_ID=$(echo "$STS" | jq -r '.Credentials.AccessKeyId // 1')
  AWS_SECRET_ACCESS_KEY=$(echo "$STS" | jq -r '.Credentials.SecretAccessKey // 1')
  export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
  unset AWS_PROFILE
  unset AWS_DEFAULT_PROFILE
}

# . "/etc/profiles/per-user/theocodes/etc/profile.d/hm-session-vars.sh"

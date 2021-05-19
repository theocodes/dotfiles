#!/bin/sh

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

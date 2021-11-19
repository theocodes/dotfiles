signin () {
  eval $(op signin felippe.1password.com)
}

aws-region() {
  region=${1:-us-east-1}
  export AWS_REGION=$region
  export AWS_DEFAULT_REGION=$region
}

aws-profile() {
  profile=${1:-dev}
  export AWS_PROFILE=$profile
  export AWS_DEFAULT_PROFILE=$profile

  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  aws s3 ls > /dev/null
}

aws-setenv() {
  STS='{}'
  FILE="$HOME/.aws/cli/cache/$1.json"
  if [ -s "$FILE" ]; then
    STS=$(cat "$FILE")
    DATE=date
    if [ $(uname) = 'Darwin' ]; then
      DATE=gdate
    fi
    expires=$($DATE -d "$(cat "$FILE" | jq -r .ResponseMetadata.HTTPHeaders.date)" +%s)
    now=$($DATE +%s)
    if [ $now -gt $expires ]; then
      aws-profile "$1" "$AWS_REGION"
      aws s3 ls > /dev/null
      STS=$(cat "$FILE")
    fi
    AWS_SESSION_TOKEN=$(echo "$STS" | jq -r '.Credentials.SessionToken // 1')
    export AWS_SESSION_TOKEN
  else
    unset AWS_SESSION_TOKEN
  fi
  AWS_ACCESS_KEY_ID=$(echo "$STS" | jq -r '.Credentials.AccessKeyId // 1')
  AWS_SECRET_ACCESS_KEY=$(echo "$STS" | jq -r '.Credentials.SecretAccessKey // 1')
  export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
  unset AWS_PROFILE
  unset AWS_DEFAULT_PROFILE
}

bolt-setenv() {
  export QUAY_ACCESS_TOKEN=$(secrets get quay_access_token)
  export CIRCLE_TOKEN=$(secrets get circle_token)
  export GITHUB_TOKEN=$(secrets get github_token)
  export FABRIC_MANAGEMENT_AUTH_TOKEN=$(secrets get fabric_token)
  export FABRIC_TOKEN=$(secrets get fabric_token)
}

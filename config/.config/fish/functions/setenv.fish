function setenv -a item
  eval "_setenv_$item $argv"
end

function _setenv_aws
    argparse r/role -- $argv

    if not set -q _flag_role
        echo "setenv aws --role ROLE_NAME"
        return 0
    end

    set role $argv[2]
    set file "$HOME/.aws/cli/cache/$role.json"
    set contents "{}"

    if test -e $file
      set contents (cat $file)
      set -gx AWS_SESSION_TOKEN (echo $contents | jq -r '.Credentials.SessionToken // 1')
    else
      set -e AWS_SESSION_TOKEN
    end

    set -gx AWS_ACCESS_KEY_ID (echo $contents | jq -r '.Credentials.AccessKeyId // 1')
    set -gx AWS_SECRET_ACCESS_KEY (echo $contents | jq -r '.Credentials.SecretAccessKey // 1')
    
    set -e AWS_PROFILE
    set -e AWS_DEFAULT_PROFILE
end

function _setenv_bolt
  signin

  set -gx QUAY_ACCESS_TOKEN (secrets get quay_access_token)
  set -gx CIRCLE_TOKEN (secrets get circle_token)
  set -gx GITHUB_TOKEN (secrets get github_token)
end

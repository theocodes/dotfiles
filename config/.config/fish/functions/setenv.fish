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
    set -gx QUAY_ACCESS_TOKEN (secrets get quay_access_token)
    set -gx CIRCLE_TOKEN (secrets get circle_token)
    set -gx GITHUB_TOKEN (secrets get github_token)

    set fabric_token (secrets get fabric_token)
    set -gx FABRIC_MANAGEMENT_AUTH_TOKEN $fabric_token
    set -gx FABRIC_TOKEN $fabric_token

    set -gx BOLT_AUTH_TOKEN (secrets get bolt_token)
    set -gx FABRIC_SOURCES_AUTH_TOKEN (secrets get fabric_sources_auth_token)
end

function signin -d "sign in with secrets provider"
    if ! test -e $HOME/.op_session
        set session_token (op signin --raw)
        echo $session_token > $HOME/.op_session
    end

    set session_age (math (date +%s) - (stat --printf '%Y' ~/.op_session))

    if test $session_age -ge 1501
        set session_token (op signin --raw)
        echo $session_token > $HOME/.op_session
    end

    set active_session_token (cat $HOME/.op_session)
    eval "export OP_SESSION_felippe=$active_session_token"
end

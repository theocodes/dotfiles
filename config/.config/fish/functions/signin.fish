function signin -d "sign in with secrets provider"
    set session_token (op signin --raw)
    eval "export OP_SESSION_felippe=$session_token"
end

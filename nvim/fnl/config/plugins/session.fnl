(local session (require :auto-session))
(local config {})

(set config.log_level "info")
(set config.auto_session_suppress_dirs ["~/" "~/Projects"])

(session.setup config)

(module config.plugins.session
  {require {session auto-session}})

(def- config {})

(set config.log_level "info")
(set config.auto_session_suppress_dirs ["~/" "~/Projects"])

(session.setup config)

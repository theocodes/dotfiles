(module config.plugins.fzf
  {require {fzf fzf-lua}})

(def- config {})

(set config.winopts {})
(set config.winopts.border "single")
(set config.winopts.fullscreen false)

(set config.winopts.preview {})
(set config.winopts.preview.vertical "up:80%")
(set config.winopts.preview.layout "vertical")

(fzf.setup config)

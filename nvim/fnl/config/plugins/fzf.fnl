(local fzf (require :fzf-lua))
(local config {})

(local winopts {})
(set winopts.border "single")
(set winopts.fullscreen false)

(local preview {})
(set preview.vertical "up:80%")
(set preview.layout "vertical")

(set winopts.preview preview)
(set config.winopts winopts)

(fzf.setup config)

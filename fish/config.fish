# NO GREETING
function fish_greeting; end

# VARIABLES
set -x DOTFILES $HOME/dotfiles
set -x EDITOR "nvim"
set -x GOPATH $HOME/go
set -x CARGOPATH $HOME/.cargo
set -x ALTERNATE_EDITOR ""
set -x HUSKY 0
set -x COLORTERM "truecolor"
set -x NOTES_DIR "~/Dropbox/notes"

if test -e $HOME/.authinfo
  set -x OPENAI_API_KEY (cat ~/.authinfo | awk '{print $6}')
end

if string match -q '*WSL*' (uname -r)
  set -x NOTES_DIR "~/winhome/Dropbox/notes"

  # Set $DISPLAY to be used by XServer for chromedriver etc
  set -x DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
end

# ABBREVIATIONS
abbr e $EDITOR
abbr rel exec $SHELL
abbr lg lazygit
abbr z zellij
abbr ll exa -al
abbr work zellij attach -c work
abbr play zellij attach -c play
abbr zr zellij run --
abbr a asdf
abbr b bat
abbr dev ./scripts/dev
abbr tf terraform
abbr gco git checkout
abbr gs git status
abbr gca git commit -a
abbr gcam git commit -a -m
abbr gp git push
abbr gl git pull --ff-only
abbr gf git fetch
abbr n notes

# ALIASES
# ...

# PATH
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/lib/ruby/gems/3.1.0/bin
fish_add_path $DOTFILES/bin
fish_add_path $GOPATH/bin
fish_add_path $CARGOPATH/bin

# PLATFORM SPECIFIC
switch (uname)
  case Linux
    source ~/.asdf/asdf.fish
  case Darwin
    source /opt/homebrew/opt/asdf/libexec/asdf.fish

    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/postgresql@12/bin
end

# PROMPT
starship init fish | source

# LOAD JUMP
status --is-interactive; and source (jump shell fish | psub)

fish_default_key_bindings

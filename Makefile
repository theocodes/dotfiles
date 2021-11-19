all:

ifeq ($(BUILD_ENV),Darwin)
all: brew nix link
else
all: link
endif

.PHONY: link
link:
	stow -R -v config --ignore "Makefile"

.PHONY: nix
nix:
	darwin-rebuild switch -I darwin-config=/Users/theocodes/dotfiles/darwin.nix

.PHONY: brew dump
brew:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

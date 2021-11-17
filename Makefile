all:

ifeq ($(BUILD_ENV),Darwin)
all: brew nix-darwin link
else
all: link
endif

.PHONY: link
link:
	stow -R -v config --ignore "Makefile"

.PHONY: nix-darwin
nix-darwin:
	darwin-rebuild switch -I darwin-config=/Users/theocodes/dotfiles/darwin.nix

.PHONY: brew
brew:
	brew bundle install

.PHONY: brew-dump
brew-dump:
	brew bundle dump -f


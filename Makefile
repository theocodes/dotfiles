all: link switch

.PHONY: link
link:
	stow -R -v config --ignore "Makefile"

.PHONY: switch
switch:
	darwin-rebuild switch -I darwin-config=/Users/theocodes/dotfiles/darwin.nix

.PHONY: bootstrap
bootstrap:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

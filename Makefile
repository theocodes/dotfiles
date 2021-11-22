all: home-manager

.PHONY: home-manager
home-manager:
	home-manager switch -f ${HOME}/dotfiles/home.nix

.PHONY: brew dump
brew:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

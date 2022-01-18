all: bootstrap

.PHONY: brew dump
brew:
	brew bundle install

bootstrap:
	./bin/bootstrap

.PHONY: dump
dump:
	brew bundle dump -f

.PHONY: link
link:
	stow -R -v zsh
	stow -R -v alacritty
	stow -R -v nvim
	stow -R -v fish
	stow -R -v git
	stow -R -v tmux
	stow -R -v emacs

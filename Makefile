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
	mkdir -p ~/.config/alacritty && stow -R -v -t ~/.config/alacritty alacritty
	mkdir -p ~/.config/nvim && stow -R -v -t ~/.config/nvim nvim
	mkdir -p ~/.config/fish && stow -R -v -t ~/.config/fish fish
	mkdir -p ~/.config/git && stow -R -v -t ~/.config/git git
	stow -R -v tmux
	stow -R -v zsh
	stow -R -v emacs

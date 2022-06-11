all: bootstrap link

bootstrap:
	./bin/oi

.PHONY: link
link:
	mkdir -p ~/.config/alacritty && stow -R -v -t ~/.config/alacritty alacritty
	mkdir -p ~/.config/nvim && stow -R -v -t ~/.config/nvim nvim
	mkdir -p ~/.config/fish && stow -R -v -t ~/.config/fish fish
	mkdir -p ~/.config/git && stow -R -v -t ~/.config/git git
	mkdir -p ~/.config/wezterm && stow -R -v -t ~/.config/wezterm wezterm
	mkdir -p ~/.emacs.d && stow -R -v -t ~/.emacs.d emacs
	stow -R -v tmux
	stow -R -v zsh

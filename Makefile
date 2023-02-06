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
	mkdir -p ~/.config/zellij && stow -R -v -t ~/.config/zellij zellij
	stow -R -v zsh
	stow -R -v helix
	stow -R -v other

.PHONY: wsl
wsl:
	rm -rf ~/winhome/AppData/Roaming/Alacritty
	mkdir -p ~/winhome/AppData/Roaming/Alacritty
	cp alacritty/alacritty.yml ~/winhome/AppData/Roaming/Alacritty/alacritty.yml
	cp alacritty/platform/wsl.yml ~/winhome/AppData/Roaming/Alacritty/wsl.yml

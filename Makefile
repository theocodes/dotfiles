nixos:
	sudo nixos-rebuild switch --flake .#

darwin:
	darwin-rebuild switch --flake .#

update:
	nix flake update

build:
	nixos-rebuild build --flake .#

stow:
	stow -v -R config

gc:
	nix-collect-garbage -d

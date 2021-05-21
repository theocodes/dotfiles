install:
	sudo nixos-rebuild switch --flake .#

update:
	nix flake update

build:
	nixos-rebuild build --flake .#

stow:
	stow -v -R config

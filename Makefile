install:
	sudo nixos-rebuild switch --flake .#

update:
	nix flake update

build:
	nixos-rebuild build --flake .#

symlink:
	stow -v -R config

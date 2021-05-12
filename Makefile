
install:
	sudo nixos-rebuild switch --flake .#

build:
	nixos-rebuild build --flake .#

update:
	nix flake update

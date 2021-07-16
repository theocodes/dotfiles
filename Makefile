all: link switch

.PHONY: link
link:
	stow -R -v . --ignore "Makefile"

.PHONY: switch
switch:
	home-manager switch

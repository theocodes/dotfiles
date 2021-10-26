.PHONY: link
link:
	stow -R -v . --ignore "Makefile"

.PHONY: install
install:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

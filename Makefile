.PHONY: link
link:
	stow -R -v config --ignore "Makefile"

.PHONY: install
install:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

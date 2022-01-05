all: link

.PHONY: link
link:
	stow -R -v .

.PHONY: brew dump
brew:
	brew bundle install

.PHONY: dump
dump:
	brew bundle dump -f

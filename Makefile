.PHONY: vim
vim:
	ln -fs $(PWD)/vim/.vimrc $(PWD)/vim/.gvimrc ~
	mkdir -p ~/.vim
	for target in $(PWD)/vim/.vim/*; do \
		ln -fs "$$target" ~/.vim; \
	done

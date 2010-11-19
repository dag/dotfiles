.PHONY: vim
vim:
	@ln -s $(PWD)/vim/.vimrc $(PWD)/vim/.gvimrc ~
	@mkdir -p ~/.vim/ftplugin/python
	@ln -s $(PWD)/vim/.vim/ftplugin/python/pyflakes.vim ~/.vim/ftplugin/python

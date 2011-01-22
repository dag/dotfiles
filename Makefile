.PHONY: vim
vim:
	ln -fs $(PWD)/vim/.vimrc $(PWD)/vim/.gvimrc ~
	mkdir -p ~/.vim
	python -c'import keyword;print "\n".join(keyword.kwlist+dir(__builtins__))'\
		|sort |uniq >~/.vim/python-globals.txt

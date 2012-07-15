PREFIX = $(HOME)

all: bash darcs git gtk vim

.PHONY: bash
bash:
	ln -bs "$(PWD)/.inputrc" "$(PREFIX)"
	ln -bs "$(PWD)/.bashrc" "$(PREFIX)"
	ln -bs "$(PWD)/.bash" "$(PREFIX)"

.PHONY: darcs
darcs:
	ln -bs "$(PWD)/.darcs" "$(PREFIX)"

.PHONY: git
git:
	ln -bs "$(PWD)/.gitconfig" "$(PREFIX)"
	mkdir -p "$(PREFIX)/.local/bin"
	curl http://defunkt.io/hub/standalone -sLo "$(PREFIX)/.local/bin/hub"
	chmod +x "$(PREFIX)/.local/bin/hub"

.PHONY: gtk
gtk:
	ln -bs "$(PWD)/.gtk-application-prefer-dark-theme" "$(PREFIX)"
	ln -bs "$(PWD)/bin/gnome-terminal" "$(PREFIX)/.local/bin"

.PHONY: vim
vim:
	mkdir -p .vim/bundle
	test -d .vim/bundle/vundle \
	  || git clone git://github.com/gmarik/vundle.git .vim/bundle/vundle
	ln -bs "$(PWD)/.vimrc" "$(PREFIX)"
	ln -bs "$(PWD)/.gvimrc" "$(PREFIX)"
	ln -bs "$(PWD)/.vim" "$(PREFIX)"

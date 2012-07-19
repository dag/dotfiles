PREFIX = $(HOME)

all: bash darcs dircolors git gtk mkv vim

mod/%:
	git submodule update --init

.PHONY: bash
bash: mod/sandboxer/sandboxer.sh
	ln -bs "$(PWD)/$<" .bash
	ln -bs "$(PWD)/.inputrc" "$(PREFIX)"
	ln -bs "$(PWD)/.bashrc" "$(PREFIX)"
	ln -bs "$(PWD)/.bash" "$(PREFIX)"

.PHONY: darcs
darcs:
	ln -bs "$(PWD)/.darcs" "$(PREFIX)"

.PHONY: dircolors
dircolors: mod/dircolors-solarized/dircolors.ansi-dark
	ln -bs "$(PWD)/$<" "$(PREFIX)/.dir_colors"

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

.PHONY: mkv
mkv:
	ln -bs "$(PWD)/bin/mkvretitle" "$(PREFIX)/.local/bin"

.PHONY: vim
vim: mod/vundle/README.md
	mkdir -p .vim/bundle
	ln -bs "$(PWD)/mod/vundle" .vim/bundle
	ln -bs "$(PWD)/.vimrc" "$(PREFIX)"
	ln -bs "$(PWD)/.gvimrc" "$(PREFIX)"
	ln -bs "$(PWD)/.vim" "$(PREFIX)"

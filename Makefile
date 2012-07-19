PREFIX = $(HOME)

all: bash darcs dircolors git gnome-terminal mkv vim

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

bin/hub:
	curl http://defunkt.io/hub/standalone -sLo $@
	chmod +x $@

.PHONY: git
git: bin/hub
	mkdir -p "$(PREFIX)/.local/bin"
	ln -bs "$(PWD)/$<" "$(PREFIX)/.local/bin"
	ln -bs "$(PWD)/.gitconfig" "$(PREFIX)"

.PHONY: gnome-terminal
gnome-terminal: mod/gnome-terminal-colors-solarized/set_dark.sh
	./$<
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

all:

install:
	test -e ~/.config/fish || ln -sf ~/work/dotfiles/.config/fish ~/.config/
	test -e ~/.config/htop || ln -sf ~/work/dotfiles/.config/htop ~/.config/

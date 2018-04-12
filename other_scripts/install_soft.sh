#!/bin/bash
#install standard soft for me
apt-get update && apt-get install -y \
	vim	    \
	gcc		\
	g++	    \
	make	\
	wget	\
	curl	\
	ssh		\
	openssl	\
	git		\
	locate	\
	links	
#plugins for vim - remark! copy .vimrc in future
#-------------------------------------------------------------------------------------------
#https://github.com/VundleVim/Vundle.vim
#https://github.com/vim-syntastic/syntastic
#https://github.com/kien/ctrlp.vim
#https://github.com/scrooloose/nerdtree
#https://github.com/altercation/vim-colors-solarized
#https://github.com/Valloric/YouCompleteMe
#https://github.com/terryma/vim-multiple-cursors
#-------------------------------------------------------------------------------------------
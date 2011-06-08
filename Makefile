##    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##    All rights reserved.

OS:=$(shell uname -o)

ifeq ($(OS), Msys)
PLATFORM=windows
PLATFORM_UPDATE_CMD=@cmd /C 'git pull && git status'
else
PLATFORM=unix
PLATFORM_UPDATE_CMD=@(git pull && git status)
endif

all: backup $(PLATFORM) homebin rcfiles vim

homebin: bin

rcfiles: .gitattributes .gitconfig .gitignore .hgrc .hushlogin .inputrc .profile .Xmodmap

vim: .vim .vimrc

windows:
	@cmd /C 'mklink /H ../.gitconfig dotfiles/.gitconfig'
	@cmd /C 'mklink /H ../.vimrc dotfiles/.vimrc'
	@cmd /C 'mklink /J ../vimfiles dotfiles/.vim'

unix:

update:
	$(PLATFORM_UPDATE_CMD)

backup:

clean:

.SILENT: clean

.PTHONY: all windows unix backup homebin rcfiles vim update clean


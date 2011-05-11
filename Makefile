##    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##    All rights reserved.

OS:=$(shell uname -o)

ifeq ($(OS), Msys)
PLATFORM=windows
else
PLATFORM=unix
endif

all: backup $(PLATFORM) homebin rcfiles vim emacs

homebin: bin

rcfiles: .gitattributes .gitconfig .gitignore .hgrc .hushlogin .inputrc .profile .Xmodmap

vim: .vim .vimrc

emacs: .emacs.d

windows:
	@cmd /C 'mklink /J vimfiles .vim'

unix:

backup:

clean:

.SILENT: clean

.PTHONY: all windows unix backup homebin rcfiles vim emacs clean


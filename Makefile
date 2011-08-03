##    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##    All rights reserved.

OS:=$(shell uname -s)

ifeq ($(OS), Msys)
PLATFORM=windows
PLATFORM_UPDATE_CMD=@cmd /C 'git pull && git status'
else
PLATFORM=unix
PLATFORM_UPDATE_CMD=@(git pull && git submodule init && git submodule update && \
					git submodule foreach "git pull origin master" && git status)
endif

all: backup $(PLATFORM) homebin rcfiles vim

homebin: bin

rcfiles: .gitattributes .gitconfig .gitignore .hgrc .hushlogin .inputrc .profile .Xmodmap

vim: .vim .vimrc

windows:
	-@cmd /C 'mklink /H  ..\.gitconfig  .gitconfig'
	-@cmd /C 'mklink /H  ..\.vimrc      .vimrc'
	-@cmd /C 'mklink /J  ..\vimfiles    .vim'

unix:

update:
	$(PLATFORM_UPDATE_CMD)

backup:

clean:

.SILENT: clean

.PTHONY: all windows unix backup homebin rcfiles vim update clean


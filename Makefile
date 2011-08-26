##    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##    All rights reserved.

OS:=$(shell uname -s | sed -e 's|_.*||g')

ifeq ($(OS), MINGW32)
PLATFORM=windows
PLATFORM_SUBINIT_CMD=@cmd /C 'git submodule init && git submodule update && git status'
PLATFORM_UPDATE_CMD=@cmd /C 'git pull && git submodule foreach git checkout master && git submodule foreach git pull && git status'
else
PLATFORM=unix
PLATFORM_SUBINIT_CMD=@(git submodule init && git submodule update && git status)
PLATFORM_UPDATE_CMD=@(git pull && git submodule foreach "git checkout master && git pull" && git status)
endif

all: backup $(PLATFORM) homebin rcfiles vim

homebin: bin

rcfiles: .gitattributes .gitconfig .gitignore .hgrc .hushlogin .inputrc .profile .Xmodmap

vim: .vim .vimrc

windows:
	-@cmd /C 'mklink /H  ..\.gitconfig  .gitconfig'
	-@cmd /C 'mklink /H  ..\.vimrc      .vimrc'
	-@cmd /C 'mklink /H  ..\.hgrc       .hgrc'
	-@cmd /C 'mklink /J  ..\vimfiles    .vim'

unix:

init:
		$(PLATFORM_SUBINIT_CMD)

update:
	$(PLATFORM_UPDATE_CMD)

backup:

clean:

.SILENT: clean

.PTHONY: all windows unix backup homebin rcfiles vim init update clean


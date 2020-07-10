# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Goog depot tools
if [ -d "$HOME/projects/google/depot_tools" ] ; then
    PATH=$PATH:$HOME/projects/google/depot_tools
fi

export INTEL_BATCH=1

export DEBFULLNAME="Oleg Kertanov"
export DEBEMAIL="okertanov@gmail.com"

export EDITOR=vim

# OSX Stuff
export ARCHFLAGS="-arch x86_64"

#alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias ll='ls -Gl'
alias Emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias mc='LANG=C mc'

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export PATH=/usr/local/bin:$PATH


##
## Node dev setting: fix out of mem
##

export NODE_OPTIONS=--max_old_space_size=4096


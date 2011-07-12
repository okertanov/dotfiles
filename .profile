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

export EC2_PRIVATE_KEY=$HOME/projects/amazon-aws/pk-UHWBOOFY3QIS4AGN5J63WYZIHTFLPYK6.pem
export EC2_CERT=$HOME/projects/amazon-aws/cert-UHWBOOFY3QIS4AGN5J63WYZIHTFLPYK6.pem

export EDITOR=vim

alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias ll='ls -Gl'


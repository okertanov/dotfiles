okertanov's dotfiles
====================

![.face](https://github.com/okertanov/dotfiles/raw/master/.face "My .face file")

Install on the clean system
-----------------------------------
    cd ~
    git clone git@github.com:okertanov/dotfiles.git ditfiles
    cd dotfiles
    make init update
    cd ~
    ln -s dotfiles/.gitconfig .gitconfig
    ln -s dotfiles/.vimrc .vimrc
    ln -s dotfiles/.vim .vim
    ln -s dotfiles/.screenrc .screenrc
    ln -s dotfiles/.profile .profile
    ln -s dotfiles/.oh-my-zsh .oh-my-zsh
    ln -s dotfiles/.zshrc .zshrc
    ln -s dotfiles/.zprofile .zprofile

    ln -s dotfiles/.icons .icons
    ln -s dotfiles/.face .face
    ln -s dotfiles/bin bin
    ln -s dotfiles/.inputrc .inputrc
    ln -s dotfiles/.hushlogin .hushlogin

Post Install on some platforms
------------------------------
### Windows
    make

### Unix
    nothing


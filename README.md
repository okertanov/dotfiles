okertanov's dotfiles
====================

![.face](https://github.com/okertanov/dotfiles/raw/master/.face "My .face file")

How to create your own dotfiles repo
------------------------------------
    cd ~
    git init
    vim .gitignore
    git add .
    git commit -a -m "Initial dotfiles import"
    curl -X POST https://user:password@github.com/api/v2/json/repos/create -F 'name=dotfiles'
    git remote add origin git@github.com:user/dotfiles
    git push -u origin master

Install on the clean system (in-place)
--------------------------------------
    cd ~
    git init
    git remote add origin git@github.com:okertanov/dotfiles
    git fetch
    git fetch origin master
    git checkout master
    git remote update
    git pull
    git status

Install on the clean system (aside)
-----------------------------------
    cd ~
    git clone git@github.com:okertanov/dotfiles.git ditfiles
    cd dotfiles
    git submodule init
    git submodule update
    cd ~

    ln -s dotfiles/.gitconfig .gitconfig
    ln -s dotfiles/.vimrc .vimrc
    ln -s dotfiles/.vim .vim
    ln -s dotfiles/.screenrc .screenrc
    ln -s dotfiles/.profile .profile
    ln -s dotfiles/.oh-my-zsh .oh-my-zsh
    ln -s dotfiles/.zshrc .zshrc
    ln -s dotfiles/.zprofile .zprofile

    ln -s dotfiles/.hgrc .hgrc
    ln -s dotfiles/.hushlogin .hushlogin

Post Install on some platforms
------------------------------
### Windows
    cd ~
    make

### Unix
    nothing

My dotfiled hosts
-----------------
* ☑  ok-dev
* ☑  crater
* ☐  dorado
* ☑  netra
* ☐  taurus
* ☑  proton


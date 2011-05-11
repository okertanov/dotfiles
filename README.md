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

Install on the clean system
---------------------------
    cd ~
    git init
    git remote add origin git@github.com:okertanov/dotfiles
    git fetch
    git fetch origin master
    git checkout master
    git remote update
    git pull
    git status

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
* ☐  proton


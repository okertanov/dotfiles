#!/bin/sh

##   Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##   All rights reserved.

function error
{
    echo $*
    exit 1
}

if [$# -eq 1] ; then
    PROJ=$1
    USAGE=cd /srv/git && sudo $0 project-name

    echo "Creating $PROJ..."

    pushd ./ || error("Can't pushd current directory")
    mkdir $PROJ || error("Can't create directory $PROJ")
    cd $PROJ || error("Can't change cwd to directory $PROJ")
    git init --bare --shared $PROJ.git
    git update-server-info

    popd || error("Can't popd current directory")
    chown -R root:developers ./$PROJ.git || error("Can't chown")
    chmod -R g+wX,o= ./$PROJ.git || error("Can't chmod")
    find ./$PROJ.git -type d -exec chmod g+s '{}' ';' || error("Can't find -exec")

    echo "Done."
else
    echo $USAGE
    exit 1
fi

exit 0


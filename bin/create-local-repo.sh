#!/bin/bash

##   Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##   All rights reserved.

USAGE="Usage: \n\tcd /srv/git && sudo $0 project-name"

function error {
    echo $*
    exit 1
}

if [ $# -eq 1 ] ; then
    PROJ=$1.git

    echo "Creating $PROJ..."

    pushd ./ || error "Can't pushd current directory"
    mkdir $PROJ || error "Can't create directory $PROJ"
    cd $PROJ || error "Can't change cwd to directory $PROJ"
    git init --bare --shared -- .
    git update-server-info

    popd || error "Can't popd current directory"
    chown -R root:developers ./$PROJ || error "Can't chown"
    chmod -R g+wX,o= ./$PROJ || error "Can't chmod"
    find ./$PROJ -type d -exec chmod g+s '{}' ';' || error "Can't find -exec"

    echo "Done."
else
    echo -e $USAGE
    exit 1
fi

exit 0


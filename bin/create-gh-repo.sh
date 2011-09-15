#!/bin/bash

##   Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##   All rights reserved.

# http://develop.github.com/

USAGE="Usage: \n\t$0 user password project-name"

if [ $# -eq 3 ] ; then
    USER=$1
    PASS=$2
    PROJ=$3
    CMD="curl -X POST https://$USER:$PASS@github.com/api/v2/json/repos/create -F 'name=$PROJ'"

    echo "Creating $PROJ with $CMD"
    eval $CMD
else
    echo -e $USAGE
    exit 1
fi

exit 0


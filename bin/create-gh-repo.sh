#!/bin/sh

##   Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
##   All rights reserved.

# http://develop.github.com/

if [$# -eq 3] ; then
    USER=$1
    PASS=$2
    PROJ=$3
    USAGE=$0 user password project-name
    CMD=curl -X POST https://$USER:$PASS@github.com/api/v2/json/repos/create -F \'$PROJ\'

    echo "Creating $PROJ with $CMD"
    $CMD
else
    echo $USAGE
    exit 1
fi

exit 0


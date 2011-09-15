#!/bin/bash

#    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
#    All rights reserved.

screen -S log splitvt \
    -upper 'tail -f log/access.log' \
    -lower 'tail -f log/error.log'


#!/bin/bash

screen -S log splitvt \
    -upper 'tail -f log/access.log' \
    -lower 'tail -f log/error.log'


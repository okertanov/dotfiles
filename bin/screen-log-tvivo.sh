#!/bin/bash

screen -S log splitvt \
    -upper 'tail -f public_html/tvivo.espectrale.com/log/access.log' \
    -lower 'tail -f public_html/tvivo.espectrale.com/log/error.log'


if exist %HOME%/vimfiles goto end
mklink /D %HOME%/vimfiles %HOME%/.vim

:end
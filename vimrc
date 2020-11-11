syntax on

set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 expandtab
set number
set wrap
set ruler

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
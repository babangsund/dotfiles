let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

if &compatible
  set nocompatible
endif

source ~/.vimrc

" Configuration {{
    let mapleader=' '

    " Use system clipboard
    set clipboard=unnamed

    " Enable syntax highlighting
    syntax enable

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Open new split panes to the right and bottom
    set splitbelow
    set splitright

    "Always show current position
    set ruler

    " Enable wildmenu
    set wildmenu

    " Set line numbers
    set number
    set relativenumber

    " Ignore case when searching
    set ignorecase

    " When searching try to be smart about cases 
    set smartcase

    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    set incsearch 

    " Don"t redraw while executing macros
    set lazyredraw 

    " Show matching brackets when text indicator is over them
    set showmatch

    " A buffer becomes hidden when it is abandoned
    set hidden

    " No sounds
    set noerrorbells
    set novisualbell
    set tm=500
    set t_vb=

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    " Don't wrap lines
    set nowrap

    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs
    set smarttab

    " Indent using two spaces.
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2

    " Always show the status line
    set laststatus=2

    " Stop vim trying to syntax highlight long lines, typically found in minified
    " files. This greatly reduces lag yet is still wide enough for large displays
    set synmaxcol=250

    " Highlight current line
    set cursorline
" }}

" Mappings {{
    " Search for visual selection
    vnoremap // y/\V<C-R>=escape(@','/\')<CR><CR>k

    " Unselect visual
    nnoremap <leader>/ :noh<CR>
" }}

" Plugins {{
    " Plugins will be downloaded under the specified directory.
    call plug#begin('~/.vim/plugged')

    " Declare the list of plugins.
    Plug 'morhetz/gruvbox'
    Plug 'dense-analysis/ale'
    Plug 'justinmk/vim-sneak'

    " List ends here. Plugins become visible to Vim after this call.
    call plug#end()
" }}

" Configure Plugins {{
    " Gruvbox
    let g:gruvbox_contrast_dark='hard'

    " ALE
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}
    let g:ale_fixers = {
    \   'javascript': ['eslint', 'prettier'],
    \}

    " Vim-sneak
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
" }}


"set termguicolors
set background=dark
colorscheme gruvbox

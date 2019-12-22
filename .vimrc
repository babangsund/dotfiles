" Configuration {{
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    set clipboard=unnamed

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " With a map leader it"s possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader=' '    

    " Open new split panes to right and bottom
    set splitbelow
    set splitright

    "Always show current position
    set ruler

    " Enable wildmenu
    set wildmenu

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

    " Don"t redraw while executing macros (good performance config)
    set lazyredraw 

    " Show matching brackets when text indicator is over them
    set showmatch

    " A buffer becomes hidden when it is abandoned
    set hidden

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    " Enable syntax highlighting
    syntax enable

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

    " Only paint n columns. Lower is better (Performance)
    set synmaxcol=100

    " Highlight current line
    "set cursorline
" }}

" Mappings {{
    " Search for visual selection
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

    " Unselect visual
    nnoremap <silent> <leader>/ :noh<CR>

    " Save vimrc
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}

" Plugins {{
    " Plugins will be downloaded under the specified directory.
    call plug#begin('~/.vim/plugged')

    " Declare the list of plugins.
    Plug 'morhetz/gruvbox'
    Plug 'dense-analysis/ale'
    Plug 'justinmk/vim-sneak'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

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

    " FZF
    nnoremap <silent> <C-P> :Files<CR>

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

    command! -bang -nargs=? -complete=dir Rg
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" }}


set termguicolors
set background=dark
colorscheme gruvbox

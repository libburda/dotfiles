syntax on
filetype plugin on

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set updatetime=100

set title
set nocompatible
set showmode

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent

set foldenable          " enable folding
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start
set hidden

" disable auto line breaking
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/swap//
set undodir=~/.config/nvim/tmp/undo//
set history=200
set undolevels=200

set number
" set relativenumber

set encoding=utf-8
set fileencoding=utf-8

set mouse=a
set clipboard=unnamedplus

set cursorline
" set cursorcolumn
set colorcolumn=80

set tags=./tags;/

set laststatus=2

set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$

" Disable cursor styling in neovim
set guicursor=a:blinkon0

"""""""""""""""""""""""
" dont set <leader> to ",", otherwise ,b mapped to CtrlP will be delayed due to
" mapping <leader>bug
"""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'sjl/gundo.vim'
    Plug 'majutsushi/tagbar'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'tpope/vim-fugitive'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

"    Plug 'camspiers/animate.vim'
"    Plug 'camspiers/lens.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" prefer python3 (Gundo uses python2.7 by default)
let g:gundo_prefer_python3 = 1

" enable using regexp in ctrlp
let g:ctrlp_regexp=1

" <Tab> settings for Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType yaml set autoindent tabstop=2 shiftwidth=2 expandtab
autocmd FileType yml set autoindent tabstop=2 shiftwidth=2 expandtab

let base16colorspace=256
set background=dark
colorscheme base16-tomorrow-night

map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFocusToggle<CR>
map <F4> :GundoToggle<CR>
map <F5> :TagbarToggle<CR>

" CtrlP config mapping
nnoremap ,f :CtrlP<CR>
nnoremap ,b :CtrlPBuffer<CR>
nnoremap ,t :CtrlPTag<CR>

noremap j gj
noremap k gk
"noremap <C-m> gt
"noremap <C-n> gT
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" indent block and get back to visual mode
vnoremap < <gv
vnoremap > >gv

inoremap {<CR> {<CR>}<Esc>ko

" clipboard
vnoremap  ,y  "+y
nnoremap  ,y  "+y

nnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,p "+p
vnoremap ,P "+P

" terminal
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""
" coc                   "
"                       "
"""""""""""""""""""""""""

let g:coc_global_extensions = [
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-sh',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-clangd'
  \ ]

set completeopt=noinsert,menuone,noselect

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-n>" :
      \ coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap ,cd <Plug>(coc-definition)
nmap ,cy <Plug>(coc-type-definition)
nmap ,ci <Plug>(coc-implementation)
nmap ,cr <Plug>(coc-references)
" Symbol renaming.
nmap ,cn <Plug>(coc-rename)
" CocAction
nmap ,ca :CocAction<CR>

" Formatting selected code.
xmap ,cf <Plug>(coc-format-selected)
nmap ,cf <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

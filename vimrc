syntax on
filetype plugin on

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set title
set nocompatible 
set showmode

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

set nobackup
set nowritebackup
set noswapfile

set number
" set relativenumber

set undofile
set undodir=~/.vim/tmp/undo//
set history=200
set undolevels=200

set encoding=utf-8
set fileencoding=utf-8

"set mouse=n
set clipboard=unnamed

set cursorline
" set cursorcolumn
set colorcolumn=80

set wildmenu
set wildmode=list:longest,full

set tags=./tags;/

set laststatus=2

set statusline=
set statusline=%F         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding
set statusline+=[%l        " Current line
set statusline+=/         " Separator
set statusline+=%L]        " Total lines

set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$

"""""""""""""""""""""""
" dont set <leader> to ",", otherwise ,b mapped to CtrlP will be delayed due to
" mapping <leader>bug
"""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"    Plug 'vim-scripts/AutoComplPop'
"    Plug 'vim-scripts/L9'
"    Plug 'othree/vim-autocomplpop'
    Plug 'lifepillar/vim-mucomplete'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'sjl/gundo.vim'
    Plug 'majutsushi/tagbar'
    Plug 'chr4/nginx.vim'
    Plug 'vim-scripts/dhcpd.vim'
    Plug 'dhruvasagar/vim-table-mode'

call plug#end()

" enable using regexp in ctrlp
let g:ctrlp_regexp=1

" AutoComplPop
"let g:acp_enableAtStartup = 1
"let g:acp_ignorecaseOption = 1
"let g:AutoComplPopDontSelectFirst = 1

""""""""""""""
" mucomplete
""""""""""""""
set complete=.
set complete+=w
set complete+=b
set complete+=u
set complete+=U
set complete+=t

" Disable showing preview buffer
set completeopt+=menu
set completeopt+=menuone
set completeopt-=preview
set completeopt+=longest

if has('patch-7.4-775')
    set completeopt+=noinsert
    set completeopt+=noselect
endif
let g:mucomplete#enable_auto_at_startup = 1
imap <c-j> <plug>(MUcompleteFwd)
imap <c-k> <plug>(MUcompleteBwd)
if has('patch-7.4.314')
  set shortmess+=c  " Shut off completion messages
endif
if has('patch-7.4.793')
  set belloff+=ctrlg    " If Vim beeps during completion
endif

let g:mucomplete#chains = {
      \ 'default': ['c-n', 'omni', 'uspl', 'path', 'tags', 'ulti']
\ }
" end mucomplete

" <Tab> settings for Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType yaml set autoindent tabstop=2 shiftwidth=2 expandtab
autocmd FileType yml set autoindent tabstop=2 shiftwidth=2 expandtab

colorscheme base16-railscasts
set background=dark
"let base16colorspace=256

"highlight SignColumn   ctermbg=236 ctermfg=0
highlight VertSplit          ctermbg=236
highlight ColorColumn        ctermbg=237
highlight LineNr             ctermbg=236     ctermfg=240
highlight CursorLineNr       ctermbg=236     ctermfg=240
highlight CursorLine         ctermbg=236    
highlight StatusLineNC       ctermbg=238     ctermfg=0
highlight StatusLine         ctermbg=240     ctermfg=12
highlight IncSearch          ctermbg=3       ctermfg=1
highlight Search             ctermbg=1       ctermfg=3
highlight Visual             ctermbg=3       ctermfg=0
highlight Pmenu              ctermbg=240     ctermfg=12
highlight PmenuSel           ctermbg=3       ctermfg=1
highlight SpellBad           ctermbg=0       ctermfg=1
" Tab bar
highlight TabLine            ctermbg=236     ctermfg=240 
highlight TabLineSel         ctermbg=237                
highlight TabLineFill        ctermbg=236                

highlight Folded             ctermbg=238     ctermfg=2
highlight FoldColumn         ctermbg=238     ctermfg=2

highlight DiffAdd            ctermbg=2       ctermfg=0 
highlight DiffDelete         ctermbg=1       ctermfg=0 
highlight DiffChange         ctermbg=4       ctermfg=0 
highlight DiffText           ctermbg=4       ctermfg=0 

highlight MatchParen         ctermbg=240     ctermfg=15
highlight cErrInParen        ctermbg=0

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
noremap <C-m> gt
noremap <C-n> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" indent block and get back to visual mode
vnoremap < <gv
vnoremap > >gv

inoremap {<CR> {<CR>}<Esc>ko

" clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


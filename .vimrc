call plug#begin('~/.vim/plugged')
" Plug 'ajh17/VimCompletesMe'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'rhysd/clever-f.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Run :PlugInstall
" Run :PlugClean

set number
set ignorecase
set noincsearch
set smartcase

set nohlsearch

syntax enable
colorscheme delek 

" Performance
set re=1
set ttyfast
set lazyredraw

set autoindent
set smartindent

set colorcolumn=120

nnoremap <ENTER> o<ESC>

" Delete without yanking
nnoremap x "_x
nnoremap <Del> "_x
nnoremap d "_d
nnoremap D "_D

" Delete without yanking
vnoremap <Del> "_d
vnoremap d "_d

" Paste without yanking
vnoremap p "_dP

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

nnoremap <C-E> <C-E><C-E>
nnoremap <C-Y> <C-Y><C-Y>

set clipboard=unnamedplus

set relativenumber
set rnu

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

set cursorline
autocmd colorscheme delek highlight CursorLine cterm=NONE ctermbg=234  

set mouse=a

" Keep visaul block active when indenting
vmap > >gv
vmap < <gv

" Scroll by visual lines
nnoremap j gj
nnoremap k gk

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun

" Highlight and replace
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/gc<left><left><left>
vnoremap / "hy/<C-r>h<Return>N

" Set font of gvim
if has("gui_running")
  set guifont=Source\ Code\ Pro\ 13
endif

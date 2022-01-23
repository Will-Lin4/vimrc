call plug#begin('~/.vim/plugged')
" Plug 'ajh17/VimCompletesMe'
Plug 'itchyny/lightline.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'rhysd/clever-f.vim'
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

set colorcolumn=80

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

let g:indentLine_enabled = 0

nnoremap <C-E> <C-E><C-E>
nnoremap <C-Y> <C-Y><C-Y>

set clipboard^=unnamed,unnamedplus

set relativenumber
set rnu

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set cursorline
autocmd colorscheme delek highlight CursorLine cterm=NONE ctermbg=234  

" set mouse=a

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

func! EscapeLastRegister()
    return escape(@", '^$.*/\[]')
endfun

" Highlight and replace
vnoremap <C-r> 
    \ma
    \"by
    \:let @a = EscapeLastRegister()<CR>
    \:,$s/<C-r>a/<C-r>b/gc
    \<Bar> 1,''-&&
    \<Bar> call feedkeys("'a")
    \<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

vnoremap /
    \"by
    \:let @b = EscapeLastRegister()<CR>
    \/<C-r>b<Return>N

" gvim configuration
if has("gui_running")
  set guifont=Source\ Code\ Pro\ 13
  colorscheme slate
endif

" Automatically adjust tabs settings depend on file.
function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
    endif
endfunction

" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()


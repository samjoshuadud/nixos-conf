
let mapleader=" "

set relativenumber
set nowrap
set ignorecase
set hidden
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

inoremap jk <Esc>
inoremap kj <Esc>

call plug#begin('~/.vim/plugged')

" File explorer & fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'      " Git integration
Plug 'vim-airline/vim-airline' " Statusline

Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Enable for specific filetypes
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
" Trigger automatically on '>'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,xml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1

nnoremap <C-p> :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <leader>d :copy .<CR>

nnoremap <C-n> :Ex<CR>

let mapleader=" "

function! DeleteMark()
  let l:mark = nr2char(getchar())

  execute 'delmarks ' . l:mark
endfunction

nnoremap <leader>m :call DeleteMark()<CR>


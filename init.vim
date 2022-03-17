" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'udalov/kotlin-vim'
call plug#end()

" Theme
colorscheme gruvbox
set background=dark

" Moving/Columns
set mouse=a
set scrolloff=4
set signcolumn=yes colorcolumn=80 cursorline
set nowrap

" Syntax/Indentation
syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent smartindent
set wildmode=longest,list,full

" Format/Encoding
set fileformat=unix
set encoding=UTF-8

" Search
set hlsearch incsearch
set ignorecase smartcase

" Numbers/Windows
set number relativenumber
set splitright splitbelow

" FileType Setup
set nocompatible
filetype plugin on

" Language Mappings
autocmd FileType c nnoremap <F5> :w <CR> :sp <CR> :resize 10 <CR> :term gcc % -o %< && ./%< <CR>
autocmd FileType sh nnoremap <F5> :w <CR> :sp <CR> :resize 10 <CR> :term sh % <CR>
autocmd FileType python nnoremap <F5> :w <CR> :sp <CR> :resize 10 <CR> :term python3 % <CR>
autocmd FileType groff,nroff nnoremap <F5> :w <CR> :sp <CR> :resize 10 <CR> :term groff -ms -k % -T pdf > %<.pdf <CR>
autocmd FileType tex,latex,plaintex nnoremap <F5> :w <CR> :sp <CR> :resize 10 <CR> :term pdflatex % <CR>

" Language Specific Indentation
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype kotlin setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Plugin Mappings
nnoremap <F8> :Tagbar <CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Window Mappings
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Save
nnoremap <C-s> :w <CR>

" Terminal
nnoremap <A-t> :sp <CR> :resize 10 <CR> :term <CR>
 
" Plugin configurations
let g:user_emmet_mode='nv'
let g:user_emmet_leader_key=','

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

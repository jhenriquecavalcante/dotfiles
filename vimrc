" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vimwiki/vimwiki'
call plug#end()

" Theme
colorscheme gruvbox
set background=dark

" Moving/Columns
set mouse=a
set scrolloff=4
set signcolumn=yes
set colorcolumn=80
set cursorline
set nowrap

" Syntax/Indentation
syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set wildmode=longest,list,full

" Spell checking
hi clear SpellBad
hi SpellBad cterm=underline
nnoremap <C-S-e> :setlocal spell! spelllang=en <CR>
nnoremap <C-S-p> :setlocal spell! spelllang=pt <CR>

" Format/Encoding
set fileformat=unix
set encoding=UTF-8

" Search
set hlsearch incsearch
set ignorecase smartcase

" Numbers/Windows
set number relativenumber
set splitright splitbelow
nnoremap <F3> :set number! relativenumber! <CR>

" FileType Setup
set nocompatible
filetype plugin on

" Language Mappings
autocmd FileType c nnoremap <F5> :w <CR> :!clear && gcc % -o %< && ./%< <CR>
autocmd FileType python nnoremap <F5> :w <CR> :!clear && python3 % <CR>
autocmd FileType sh nnoremap <F5> :w <CR> :!clear && sh % <CR>
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

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

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

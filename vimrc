
" Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Font
set guifont=Monaco

" Show line numbers
set number

" Soft tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Tab size is 2
set ts=2

" list tabs and trailing whitespace
set list listchars=tab:\▸\ ,trail:·

" Highlight searches
set hlsearch

" Autoindent
set autoindent

" Show a long lines marker
set colorcolumn=80

" Map ⌘-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
"set smarttab

set ai "Auto indent
set si "Smart indent

set number
set tw=79
set formatoptions+=t

"set nohlsearch

set background=dark
"colorscheme desert

au BufRead,BufNewFile *.md set filetype=markdown
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" source code formatting with clang-format
map <C-K> :pyf ~/bin/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/bin/clang-format.py<CR>i

" toggle white space characters visible
" http://stackoverflow.com/questions/4998582/show-whitespace-characters-in-gvim
map <F2> :set list!<CR>
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc

" toggle spell check
map <F3> :setlocal spell! spelllang=en_us<CR>

" swap beteen header and source files
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
map <F5> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>


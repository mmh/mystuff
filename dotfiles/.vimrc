set nocompatible
set fileencodings=utf-8
"set mouse=a
"set fileencodings=utf-8,iso-8859-1
set title
set ruler "show the cursor position all the time
" codeing standard stuff
set softtabstop=2 " Standard vi interprets the tab key literally, but there are popular vi-derived alternatives that are smarter, like vim. To get vim to interpret tab as an ``indent'' command instead of an insert-a-tab command
set shiftwidth=2 "Number of spaces to use for each insertion of (auto)indent.
set tabstop=4 "To cause the TAB file-character to be displayed as mod-N in vi and vim (what Emacs calls tab-width). Could be 8?
set expandtab "To cause TAB characters to not be used in the file for compression, and for only spaces to be used (what emacs calls indent-tabs-mode)
set showmatch "parenthesis matching
" search stuff
set ignorecase smartcase "ignore case in all-lowercase searches
set incsearch
set hlsearch
" macros
:map <F2> <home>iDONE <Esc>
:map <F3> F$ywA<NL>error_log('<Esc>pA = ' . <Esc>pA);<Esc>
:map <F4> F$y2wA<NL>error_log(__LINE__.':'.__FILE__.' <Esc>pA = ' . <Esc>pA);<Esc>
:map <F5> ggVG=

" Note: Uses mark n
":map <ESC> :nohlsearch<CR>
"
" Comment lines with -   -- default is # because of shell scripts, configs etc.
map - :s/^/#/<CR>:nohls<CR>
" Uncomment lines with _
" Working with: //   --   >   #   "   %   !   ;
map _ :s:\\|^\/\/\\|^--\\|^> \\|^[#"%!;]::<CR>:nohls<CR>

" F9  - comment this line with HTML comments
autocmd FileType html map <F9> :s:^\s*:&<!-- :<CR>:s:$: -->:<CR>:nohls<CR>
" F10 - uncomment FOLLOWING pair/block of HTML comments
autocmd FileType html map <F10> k:/<!--/,/-->/s:<!-- \=\\| \=-->::g<CR>:nohls<CR>
" Apply rot13 to entire file, in case you're writing something secret :-)
map <F11> mnggVGg?'n
" remove search hilight
nnoremap <F12> :nohls<CR>

filetype on
augroup vimrc_filetype
    autocmd!
    autocmd FileType    c,cpp,java,php  map - :s/^/\/\//<CR>:nohls<CR>
    autocmd FileType    vim             map - :s/^/\"/<CR>:nohls<CR>
    autocmd FileType    ruby,python     map - :s/^/#/<CR>:nohls<CR>
    autocmd FileType    xdefaults       map - :s/^/!/<CR>:nohls<CR>
    autocmd FileType    lisp,scheme,bind  map - :s/^/;/<CR>:nohls<CR>

    " Syntax-indenting for programming...
    autocmd FileType    c,cpp,java,php  set foldmethod=syntax
    autocmd FileType    c,cpp,java,php  imap {<CR>  {<CR>}<Esc>O
augroup end

set bg=dark

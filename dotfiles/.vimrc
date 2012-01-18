set nocompatible
set fileencodings=utf-8,iso-8859-1 " makes it possible to edit both utf-8 and latin files
"set fileencodings=utf-8
"set mouse=a
set title
set ruler "show the cursor position all the time
" coding standard stuff
set softtabstop=2 " Standard vi interprets the tab key literally, but there are popular vi-derived alternatives that are smarter, like vim. To get vim to interpret tab as an ``indent'' command instead of an insert-a-tab command
set shiftwidth=2 "Number of spaces to use for each insertion of (auto)indent.
set tabstop=2 "To cause the TAB file-character to be displayed as mod-N in vi and vim (what Emacs calls tab-width). Could be 8?
set expandtab "To cause TAB characters to not be used in the file for compression, and for only spaces to be used (what emacs calls indent-tabs-mode)
set showmatch "parenthesis matching
set autoindent
set smartindent
" search stuff
set ignorecase smartcase "ignore case in all-lowercase searches
set incsearch
set hlsearch
" macros
:map <F2> <home>iDONE <Esc>
:map <F3> F$ywA<NL>error_log('<Esc>pA = ' . <Esc>pA);<Esc>
:map <F4> F$y2wA<NL>error_log(__LINE__.':'.__FILE__.' <Esc>pA = ' . <Esc>pA);<Esc>
:map <F5> ggVG=

" drupal special file syntax highlighting
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on

"If you like SQL syntax highlighting inside Strings: >
let php_sql_query = 1
"For highlighting the Baselib methods: >
let php_baselib = 1
"Enable HTML syntax highlighting inside strings: >
let php_htmlInStrings = 1

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

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


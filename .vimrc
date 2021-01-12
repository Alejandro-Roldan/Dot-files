"--------------------------------------------------------------------------------------------------
" 
" Show the current file as the title
set title

" Enable Syntax highlighting
syntax on

" Highlight the line currently under the cursor
set cursorline

" Number of lines to keep above and below the cursor
set scrolloff=5

" Enable line wrapping
set wrap

" Avoid wrapping a line in the middle of a word
set linebreak

" Attempts to determine the indentation from the file extension 
filetype indent plugin on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch


"--------------------------------------------------------------------------------------------------
" Code Folding Options

" Fold based on indentations levels
"set foldmethod=indent
" Space will toggle folding
"nnoremap <space> za

"--------------------------------------------------------------------------------------------------
" Miscellaneous Options

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number


"--------------------------------------------------------------------------------------------------
" Mappings

" Toggle comenting
" Mapping, non recursive, for Normal, Visual, Select, Operator-pending mode(s)
noremap <silent> <expr> <C-m> (synIDattr(synID(line("."), col("."), 0), "name") =~ 'comment\c') ?
\ ':<S-Left>exe "<S-Right>normal! ".b:unCommentCommand<CR>' :
\ ':<S-Left>exe "<S-Right>normal! ".b:commentCommand<CR>'
" Mapping, non recursive, for Insert mode
"inoremap <expr> <C-m> (synIDattr(synID(line("."), col("."), 0), "name") =~ 'comment\c') ?
"\ ':<S-Left>exe "<S-Right>normal! ".b:unCommentCommand<CR>' :
"\ ':<S-Left>exe "<S-Right>normal! ".b:commentCommand<CR>'

" Define comment symbol by file type
" Files that use #
autocmd FileType sh,bash,python let b:commentCommand='I# '
autocmd FileType sh,bash,python let b:unCommentCommand='^xx'
" Files that use //
autocmd FileType c,cpp let b:commentCommand='I// '
autocmd FileType c,cpp let b:unCommentCommand='^xxx'


"--------------------------------------------------------------------------------------------------
" Commands

" Use :W to save as sudo if you forgot to launch vim with sudo
command W w !sudo tee "%" > /dev/null


"--------------------------------------------------------------------------------------------------
" Code Execution

" Python code execution
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Sh code execution
autocmd FileType sh map <buffer> <F5> :w<CR>:exec '!sh' shellescape(@%, 1)<CR>
autocmd FileType sh imap <buffer> <F5> <esc>:w<CR>:exec '!sh' shellescape(@%, 1)<CR>

" Bash code execution
autocmd FileType bash map <buffer> <F5> :w<CR>:exec '!bash' shellescape(@%, 1)<CR>
autocmd FileType bash imap <buffer> <F5> <esc>:w<CR>:exec '!bash' shellescape(@%, 1)<CR>

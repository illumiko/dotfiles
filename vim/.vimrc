
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
set history=500
"
" " Enable filetype plugins
filetype plugin on
filetype indent on
"
" " Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = " "
"
" " Fast saving
nmap <leader>w :w!<cr>
"
" " :W sudo saves the file
" " (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"
" " Avoid garbled characters in Chinese language windows OS
" let $LANG='en'
set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
"
" " Turn on the Wild menu
set wildmenu
"
set number
set relativenumber
" " Ignore compiled files
set wildignore=*.o,*~,*.pyc
 if has("win16") || has("win32")
     set wildignore+=.git\*,.hg\*,.svn\*
     else
         set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
         endif

         " Always show current position
         set ruler

         " Height of the command bar
         set cmdheight=1

         " A buffer becomes hidden when it is abandoned
         set hid

         " Configure backspace so it acts as it should act
         set backspace=eol,start,indent
         set whichwrap+=<,>,h,l

         " Ignore case when searching
         set ignorecase

         " When searching try to be smart about cases
         set smartcase

         " Highlight search results
         set hlsearch

         " Makes search act like search in modern browsers
         set incsearch

         " Don't redraw while executing macros (good performance config)
         set lazyredraw

         " For regular expressions turn magic on
         set magic

         " Show matching brackets when text indicator is over them
         set showmatch

         " How many tenths of a second to blink when matching brackets
         set mat=2

         " No annoying sound on errors
         set noerrorbells
         set novisualbell
         set t_vb=
         set tm=500

         " Properly disable sound on errors on MacVim
         if has("gui_macvim")
             autocmd GUIEnter * set vb t_vb=
             endif

             " Add a bit extra margin to the left
             set foldcolumn=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Enable syntax highlighting
 syntax enable

 " Set regular expression engine automatically
 set regexpengine=0
 set t_Co=256
 colorscheme desert
 hi Normal ctermbg=none
 hi EndOfBuffer ctermbg=none
 hi LineNrAbove ctermfg=grey
 hi LineNrBelow ctermfg=grey
 hi StatusLine ctermfg=white ctermbg=black
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "=> Files, backups and undo
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Turn backup off, since most stuff is in SVN, git etc. anyway...
 set nobackup
 set nowb
 set noswapfile


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Text, tab and indent related
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Use spaces instead of tabs
 set expandtab

 " Be smart when using tabs ;)
 set smarttab

 " 1 tab == 4 spaces
 set shiftwidth=4
 set tabstop=4

 " Linebreak on 500 characters
 set lbr
 set tw=500

 set ai "Auto indent
 set si "Smart indent
 set wrap "Wrap lines
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
inoremap jk <esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Returns true if paste mode is enabled
 function! HasPaste()
     if &paste
             return 'PASTE MODE  '
                 endif
                     return ''
                     endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle=3 "tree view
let g:netrw_banner=0 "disable annoying banner

set nocompatible    " Don't pretend to be vi
set modeline        " Customize settings based on modeline in indvidual files
set esckeys         " Cursor keys in insert mode

set autoindent      " Indent a new line based on indent of the current line
set smartindent     " Smarter autoindent based on e.g. {, }, and keywords

set expandtab       " Insert spaces instead of tab characters
set shiftwidth=4    " Number of spaces in a level of (auto)indent
set softtabstop=4   " <Tab>/<BS> insert/delete space as if tabstop has this val
set smarttab        " <Tab>/<BS> at the start of a line follow shiftwidth

set backspace=indent,eol,start
set display=lastline    " Don't render partial lines as @@@@@@@

set hlsearch
set incsearch

if has('cmdline_info')
    set ruler       " Show line/col/position of the curser
    " From http://static.gpicon.org/code/vimrc.html
    "set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Ruler on steroids
    set showcmd     " Partial cmds in status line/selection in visual mode
endif

if has('statusline')
    set laststatus=1 " show statusline only if there are > 1 windows
    "set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P 
endif

if has('mouse')
    set mouse=a     " Move cursor in response to mouse clicks
endif

execute pathogen#infect()

syntax on       " Syntax highlighting
set cursorline  " Highlight current line 

if has('gui_running')
    set showtabline=2	" Always show document tabs	
    set guioptions-=T   " Hide toolbar
    set guioptions+=e   " Draw document tabs using GUI toolkit?
    set guioptions-=t   " Hide menu tear offs
    set guicursor+=a:blinkon1000
    set guicursor+=a:blinkoff1000
    set guifont=Ubuntu\ Mono\ 12
    set columns=85
    set number
endif

" Filetype specific settings
if has('osfiletype')
    filetype on     " Sniff filetypes on open, TODO Other tweaks, plugins?
    filetype plugin on
    filetype indent on
endif

if has('autocmd')
    augroup python
    augroup END

    augroup xml
    	" TODO Use FileType instead
        autocmd BufReadPre,FileReadPre    *.xml set tabstop=2
        autocmd BufReadPre,FileReadPre    *.xml set matchpairs+=<:>
    augroup END
    
    " TODO vimrc, sql, html, css, php, asp, jsp, properties, axl
endif

set nocompatible  " use vim, no vi defaults
filetype off  " required

"""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'flazz/vim-colorschemes'
Bundle 'molokai'
Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'nono/vim-handlebars'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-eunuch'
Bundle 'br3tt/vim-slim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-supertab'
Bundle 'duff/vim-bufonly'
"Bundle 'scrooloose/nerdtree'

"""""""""""""""""""""""""""""""""""""""""""""""

syntax on  " turn on syntax highlighting
filetype plugin indent on

colorscheme desert256

set t_Co=256 " 256 colors
set number  " show line numbers
set ruler  " show line and column numbers
set encoding=utf-8  " set default encoding to UTF-8

set visualbell  " don't beep

set guioptions-=T

set nowrap  " don't wrap lines
set tabstop=2  " a tab is two spaces
set shiftwidth=2  " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab  " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

set list  " show invisible characters
set listchars=""  " reset the listchars
set listchars=tab:\ \  " a tab should display as "  "
set listchars+=trail:·  " show trailing spaces as dots
set listchars+=extends:>  " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:<  " The character to show in the last column when wrap is off and the line continues beyond the right of the screen

au BufWritePre * :%s/\s\+$//e "remove trailing whitespace

" searching
set hlsearch  " highlight matches
set incsearch  " incremental searching
set ignorecase  " searches are case insensitive
set smartcase  " unless they contain at least one capital letter

" allow switching of buffers before saving them
set hidden

" ignore these file types when tab completing or globing
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem  " disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz  " disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*  " ignore bundler and sass cache
set wildignore+=*.swp,*~,._*  " disable temp and backup files
set wildignore+=*/public/* "disable public files
set wildignore+=*/tmp/* "disable public files

" backup and swap files
set backupdir=~/.vim/_backup//  " where to put backup files
set directory=~/.vim/_temp//  " where to put swap files

" status line
set laststatus=2  " always show the status bar

" autocommands
au BufNewFile,BufRead *.json set ft=javascript  " treat JSON files like JavaScript
au VimResized * wincmd =  " resize splits when window size changes

" delete line at number without moving cursor with :#D ex- :89D
command! -range -nargs=0 D <line1>,<line2>d|norm ``

" leader is <space>
let mapleader=" "

" move around windows easier
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
map <Leader>l <C-w>l

" toggle comments
map <Leader>/ <plug>NERDCommenterToggle
map <Leader>\ <plug>NERDCommenterToggle

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" adjust viewports to the same size
map <Leader>= <C-w>=

" start a :e at the directory of the current open file
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>e :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" easy splitting
map <leader>s :split <CR> <C-w>j
map <leader>v :vsplit <CR> <C-w>l

" search using ack
map <Leader>f :Ack!<space>

" keep visual selection when indenting or outdenting
vmap <Tab> >gv
vmap <S-Tab> <gv

" remove highlighted term
nnoremap <silent> <Leader>n :nohlsearch<CR>

" git status
map <leader>gs :Gstatus <CR>

" quick quit
map <leader>q :q <CR>

imap <C-Tab> <C-p>

"""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""
" reverse results
let g:ctrlp_match_window_reversed = 0

" view most recently used files
map <Leader><Leader> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""

set guifont=Monaco:h15

fun! OpenSpec()
  let fp = expand('%')
  if match(fp, 'app/', 0) != -1
    let fp = substitute(fp, 'app/', 'spec/', '')
    let fp = substitute(fp, '.rb', '_spec.rb', '')
  else
    let fp = substitute(fp, 'spec/', 'app/', '')
    let fp = substitute(fp, '_spec.rb', '.rb', '')
  endif
  exec 'vs '. fp
endfun

command Spec call OpenSpec()

let g:Powerline_stl_path_style = 'short'

au BufNewFile,BufRead *.hamlbars set ft=haml  " treat hamlbars files like haml

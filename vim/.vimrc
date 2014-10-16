"""""""""""""""""""
" Vundle Settings "
"""""""""""""""""""

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "scrooloose/nerdtree"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "ervandew/supertab"
Bundle "scrooloose/nerdcommenter"
Bundle "godlygeek/tabular"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "flazz/vim-colorschemes"
Bundle "bling/vim-airline"
Bundle "airblade/vim-gitgutter"
Bundle "chriskempson/base16-vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "vim-ruby/vim-ruby"
Bundle "elixir-lang/vim-elixir"
Bundle "jnwhiteh/vim-golang"
Bundle "kchmck/vim-coffee-script"
Bundle "pangloss/vim-javascript"
Bundle "plasticboy/vim-markdown"

set nocompatible
syntax enable
filetype plugin indent on


""""""""""""""""
" VIM Settings "
""""""""""""""""

set showcmd
set showmode

set backspace=indent,eol,start

set hidden

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set number
set ruler
set cursorline
set cuc cul

set incsearch
set hlsearch

set wrap
set scrolloff=3

set title

set visualbell

set noswapfile
set nobackup
set nowritebackup

set history=1000
set undolevels=1000
set wildignore=*.swp,*.swo,*.bak,*.class,*.lock

set tabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8
set clipboard=unnamed

set spelllang=en
set spellfile=$HOME/Dropbox/Mac/vim/spell/en.utf-8.add

colorscheme base16-default
set bg=dark

autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile} set ft=ruby
autocmd BufRead,BufNewFile {*.eco,*.hbs} set ft=html
autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","
let &runtimepath.=",$HOME/Dropbox/Mac/vim"
let g:ConqueTerm_ReadUnfocused = 1
let g:ctrlp_working_path_mode = 0


""""""""""""""""""""
" Custom Functions "
""""""""""""""""""""

function IndentHash()
  '<,'>Tabularize /:\zs
endfunction
function IndentRocket()
  '<,'>Tabularize /^[^=>]*\zs=>/l1
endfunction
function IndentEquals()
  '<,'>Tabularize /=
endfunction


"""""""""""""""""""
" Custom Mappings "
"""""""""""""""""""

map <Leader>i= :call IndentEquals()<cr>
map <Leader>ih :call IndentHash()<cr>
map <Leader>ir :call IndentRocket()<cr>
map <A-Tab> :tabNext<cr>

vmap > >gv
vmap < <gv
vmap <Leader>cr :Tabularize /=><cr>
vmap <Leader>c= :Tabularize /=<cr>
vmap <Leader>c, :Tabularize /,<cr>
vmap <Leader>c: :Tabularize /:<cr>

nmap <S-T>o :NERDTree<Enter>
nmap <S-T>c :NERDTreeClose<Enter>
nmap <Tab> <C-w>w
nmap <Leader>cr :Tabularize /=><cr>
nmap <Leader>c= :Tabularize /=<cr>
nmap <Leader>c, :Tabularize /,<cr>
nmap <Leader>c: :Tabularize /:<cr>


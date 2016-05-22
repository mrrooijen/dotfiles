syntax enable
colorscheme base16-solarized
set background=dark

set showcmd
set showmode
set backspace=indent,eol,start
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set nofoldenable
set number
set ruler
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

hi Cursor guibg=darkred guifg=white
hi Search guibg=white guifg=darkred

map <A-Tab> :tabnext<Enter>
nmap <S-T>o :NERDTree<Enter>
nmap <S-T>c :NERDTreeClose<Enter>
nmap <Tab> <C-w>w
nmap <S-k> gg
nmap <S-j> G
vmap > >gv
vmap < <gv

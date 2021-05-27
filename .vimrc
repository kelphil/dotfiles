"--------------------------------------------------------------
"
"       | | ___ __   __   _(_)_ __ ___  _ __ ___
"       | |/ / '_ \  \ \ / / | '_ ` _ \| '__/ __|
"       |   <| |_) |  \ V /| | | | | | | | | (__
"       |_|\_\ .__/    \_/ |_|_| |_| |_|_|  \___|
"            |_|
"
"--------------------------------------------------------------
" Vundle Package Manager Settings
"--------------------------------------------------------------
set nocompatible              " be iMproved, required
set noerrorbells
set smartindent
" set termguicolors
set number
set relativenumber
set scrolloff=8
set nowrap
set paste
set pastetoggle=<F10>
set noswapfile
set nobackup
set signcolumn=yes
set hlsearch
set incsearch
set cursorline
set spelllang=en_us
set spell
set path=.,,**

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
Plugin 'gruvbox-community/gruvbox'
" Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'

call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"--------------------------------------------------------------
" User Settings by Kelvin Philip
"--------------------------------------------------------------

let mapleader=","
let g:ackprg = 'ag --nogroup --nocolor --column'

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-g> :Ag<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

" TABS
nnoremap <silent> <Tab> gt
nnoremap <silent> <S-Tab> gT


if filereadable(glob("$DOTFILES/.vimrc.local")) 
    source $DOTFILES/.vimrc.local
    source $DOTFILES/.vimrc.kp
endif

"--------------------------------------------------------------

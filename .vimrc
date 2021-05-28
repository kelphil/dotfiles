"--------------------------------------------------------------
"
"       | | ___ __   __   _(_)_ __ ___  _ __ ___
"       | |/ / '_ \  \ \ / / | '_ ` _ \| '__/ __|
"       |   <| |_) |  \ V /| | | | | | | | | (__
"       |_|\_\ .__/    \_/ |_|_| |_| |_|_|  \___|
"            |_|
"
"--------------------------------------------------------------

"--------------------------------------------------------------
" Set Leader Key
"--------------------------------------------------------------
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
nnoremap <Space> <Nop>
let mapleader=" "

"--------------------------------------------------------------
" General
"--------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

"--------------------------------------------------------------
" Vundle Package Manager Settings
"--------------------------------------------------------------
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
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'glepnir/lspsaga.nvim'
Plugin 'ray-x/lsp_signature.nvim'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'folke/trouble.nvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzf-native.nvim', { 'on': 'make' }
Plugin 'folke/todo-comments.nvim'
Plugin 'gruvbox-community/gruvbox'
Plugin 'arcticicestudio/nord-vim'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'vifm/vifm.vim'
Plugin 'mhinz/vim-startify'
Plugin 'preservim/nerdtree'
" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'

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
if filereadable(glob("$DOTFILES/.vimrc.local")) 
    source $DOTFILES/.vimrc.local
    source $DOTFILES/.vimrc.kp
endif

"--------------------------------------------------------------

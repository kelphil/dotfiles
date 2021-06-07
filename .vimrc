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
" filetype off                  " required

"--------------------------------------------------------------
" Vundle Package Manager Settings
"--------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" " All of your Plugins must be added before the following line
Plugin 'edkolev/tmuxline.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'folke/which-key.nvim'
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'glepnir/lspsaga.nvim'
Plugin 'ray-x/lsp_signature.nvim'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'folke/trouble.nvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'nvim-telescope/telescope-fzy-native.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'folke/todo-comments.nvim'
Plugin 'gruvbox-community/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'sbdchd/neoformat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-vinegar'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'
"
call vundle#end()            " required

"--------------------------------------------------------------
" User Settings by Kelvin Philip
"--------------------------------------------------------------
if filereadable(glob("$DOTFILES/.vimrc.local"))
    source $DOTFILES/.vimrc.local
    source $DOTFILES/.vimrc.kp
endif

"--------------------------------------------------------------

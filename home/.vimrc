""" Базовые настройки
set nocompatible
syntax on
set number
set ruler
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set clipboard=unnamedplus
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set wrap
set linebreak
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set history=1000
set undolevels=1000
set title
set wildmenu
set wildmode=list:longest,full
set hidden
set ttyfast

""" Настройки для разработки
set showmatch
filetype plugin indent on
set autoread
set backspace=indent,eol,start

""" Маппинги клавиш
let mapleader = ","
" Быстрое сохранение
nnoremap <leader>w :w<CR>
" Быстрый выход
nnoremap <leader>q :q<CR>
" Перемещение между окнами
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Отключение подсветки поиска
nnoremap <leader><space> :nohlsearch<CR>

""" Плагины через vim-plug (установи его отдельно)
call plug#begin('~/.vim/plugged')
" Основные плагины
Plug 'tpope/vim-sensible'           " Здравые настройки по умолчанию
Plug 'tpope/vim-surround'           " Работа со скобками/кавычками
Plug 'preservim/nerdtree'           " Файловый менеджер
Plug 'vim-airline/vim-airline'      " Статусбар
Plug 'jiangmiao/auto-pairs'         " Автозакрытие скобок
Plug 'airblade/vim-gitgutter'       " Git интеграция
Plug 'catppuccin/vim', { 'as': 'catppuccin' }  " Тема Catppuccin
call plug#end()

""" Настройка темы
set termguicolors
colorscheme catppuccin_mocha  " Варианты: mocha, macchiato, frappe, latte

""" Настройки NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

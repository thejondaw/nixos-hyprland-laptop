-- Base settings
vim.opt.number = true
vim.opt.ruler = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.hidden = true
vim.opt.ttyfast = true

-- Dev settings
vim.opt.showmatch = true
vim.cmd('filetype plugin indent on')
vim.opt.autoread = true
vim.opt.backspace = 'indent,eol,start'

-- Key mappings
vim.g.mapleader = ','
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')

-- Plugin manager (packer)
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Modern stuff
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
end)

-- Theme setup
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin-mocha"

-- NvimTree setup (modern NERDTree replacement)
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

-- Setup modern features
require('nvim-treesitter.configs').setup{
  ensure_installed = { "lua", "vim", "rust", "python", "javascript", "typescript" },
  highlight = { enable = true }
}

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup({})

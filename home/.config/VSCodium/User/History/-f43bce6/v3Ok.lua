-- Install lazy.nvim (современнее чем packer)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Base settings
vim.g.mapleader = " " -- Space как leader key (удобнее запомнить)
vim.opt.number = true
vim.opt.relativenumber = true -- Относительная нумерация (удобно для перемещения)
vim.opt.encoding = 'utf-8'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.updatetime = 100 -- Быстрее обновление гита и автодополнения
vim.opt.cursorline = true -- Подсветка текущей строки

-- Plugins
require("lazy").setup({
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },

  -- Modern file tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
  },

  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Git integration
  'lewis6991/gitsigns.nvim',

  -- Auto pairs
  'windwp/nvim-autopairs',

  -- Comments
  'numToStr/Comment.nvim',
})

-- LSP Setup
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Key mappings
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')  -- File tree
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>') -- Find files
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')  -- Find in files
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')    -- Find buffers
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Auto setup
require('nvim-treesitter.configs').setup({
  highlight = { enable = true },
  indent = { enable = true },
})

require('gitsigns').setup()
require('nvim-autopairs').setup()
require('Comment').setup()

-- Plugin Manager
require("config.lazy")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Syntax highlighting
vim.cmd("syntax on")

-- Encoding
vim.opt.encoding = "utf-8"

-- Undo and backup
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Visual feedback
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Scrolling and performance
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

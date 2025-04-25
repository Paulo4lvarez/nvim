-- Line numbers
vim.opt.number = true
vim.opt.ruler = false
vim.opt.relativenumber = true

-- Inline diagnostics
local signs = { ERROR = "", WARN = "", HINT = "", INFO = "" }

vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = function(diagnostic)
			return signs[vim.diagnostic.severity[diagnostic.severity]]
		end,
	},
})

-- Mouse support
vim.opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

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
vim.opt.showmode = false

-- Scrolling and performance
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 40
vim.opt.smoothscroll = true

-- Command-line completion
vim.opt.wildmode = "longest:full,full"

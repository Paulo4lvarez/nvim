-- Line numbers
vim.opt.number = true
vim.opt.ruler = false
vim.opt.relativenumber = true
vim.opt.winborder = "none"
vim.o.confirm = true

-- Global status line
vim.go.laststatus = 3

-- Inline diagnostics
local signs = { ERROR = " ", WARN = " ", HINT = " ", INFO = " " }

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.ERROR,
      [vim.diagnostic.severity.WARN] = signs.WARN,
      [vim.diagnostic.severity.HINT] = signs.HINT,
      [vim.diagnostic.severity.INFO] = signs.INFO,
    },
  },
  virtual_text = {
    source = "always",
    prefix = function(diagnostic)
      return signs[vim.diagnostic.severity[diagnostic.severity]]
    end,
  },
  virtual_lines = { current_line = true },
  float = { border = "rounded" },
  underline = true,
  update_in_insert = false
})

-- Mouse support
vim.opt.mouse = ""

-- Clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

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
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.o.inccommand = 'split'

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
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
vim.opt.updatetime = 250
vim.opt.smoothscroll = true

-- Command-line completion
vim.opt.wildmode = "longest:full,full"

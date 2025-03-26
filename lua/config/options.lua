-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

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
-- vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = false

-- Scrolling and performance
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 42

-- Command-line completion
-- vim.opt.wildmenu = true
-- vim.opt.wildmode = "longest:full,full"

-- HARD MODE
local hardmode = true

if hardmode then
  -- Show an error message if a disabled key is pressed
  local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

  -- Disable arrow keys in insert mode with a styled message
  vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })

  -- Disable arrow keys in normal mode with a styled message
  vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', '<Del>', msg, { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end

local map = vim.keymap.set

-- HARD MODE
local hardmode = true
-- FILE EXPLORER
-- "mini" or "oil"
local fileExplorer = "oil"

map("n", "<C-A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })

-- Change Split Commands
map("n", "<leader><leader>-", ":split<cr>", { noremap = true, silent = true })
map("n", "<leader><leader>=", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "<leader><leader>x", "<C-w>c", { noremap = true, silent = true })
map("n", "<leader><leader>o", "<C-w>o", { noremap = true, silent = true })

-- Make escaping terminal easier
map("t", "<C-n>", "<C-\\><C-n>", { silent = true })

-- Escape and Clear HLsearch
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

if hardmode then
  -- Show an error message if a disabled key is pressed
  local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

  -- Disable arrow keys in insert mode with a styled message
  map("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = true })
  map("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = true })
  map("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = true })
  map("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = true })

  -- Disable arrow keys in normal mode with a styled message
  map("n", "<Up>", msg, { noremap = true, silent = true })
  map("n", "<Down>", msg, { noremap = true, silent = true })
  map("n", "<Left>", msg, { noremap = true, silent = true })
  map("n", "<Right>", msg, { noremap = true, silent = true })
  map("n", "<Del>", msg, { noremap = true, silent = true })
  map("n", "<BS>", msg, { noremap = true, silent = true })
end

local toggleExplorer = function(fileExplorer)
  if fileExplorer == "mini" then
    return Minifiles_toggle
  elseif fileExplorer == "oil" then
    return "<CMD>Oil<CR>"
  end
end

map("n", "<leader>o", toggleExplorer(fileExplorer), { noremap = true, silent = true })

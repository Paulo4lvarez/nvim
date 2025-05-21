local map = vim.keymap.set

-- HARD MODE
local hardmode = true

-- Plugin Keymaps
map("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Oil file browser" })
map("n", "<leader>g", "<CMD>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>/", "<CMD>GrugFar<CR>", { desc = "Grug Find And Replace" })

-- QoL keymaps
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "<C-A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })

-- Change Split Commands
map("n", "<leader><leader>-", ":split<cr>", { noremap = true, silent = true, desc = "Horizontal split" })
map("n", "<leader><leader>=", ":vsplit<cr>", { noremap = true, silent = true, desc = "Vertical split" })
map("n", "<leader><leader>x", "<C-w>c", { noremap = true, silent = true, desc = "Close split" })
map("n", "<leader><leader>o", "<C-w>o", { noremap = true, silent = true, desc = "Close other splits" })
map("n", "<leader><leader>k", "<C-w><S-k>", { noremap = true, silent = true, desc = "Change orientation Up" })
map("n", "<leader><leader>j", "<C-w><S-j>", { noremap = true, silent = true, desc = "Change orientation Down" })
map("n", "<leader><leader>h", "<C-w><S-h>", { noremap = true, silent = true, desc = "Change orientation Left" })
map("n", "<leader><leader>l", "<C-w><S-l>", { noremap = true, silent = true, desc = "Change orientation Right" })

-- Make escaping terminal easier
map("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })

-- Escape and Clear HLsearch
map({ "n", "s" }, "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Escape and Clear hlsearch" })

-- Attempt 420 to add border to hover (telescope will break bc plenary doesn't like the new way of adding borders)
vim.keymap.set(
  'n', 'K',
  function()
    vim.lsp.buf.hover({ border = "rounded" })
  end,
  { desc = 'Hover Documentation' }
)

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

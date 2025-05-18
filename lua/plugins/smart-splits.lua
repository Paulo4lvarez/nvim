return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      default_amount = 1,
      at_edge = "wrap",
    })

    -- resizing splits
    -- these keymaps will also accept a range,
    vim.keymap.set('n', '<M-h>', require('smart-splits').resize_left, { desc = "Resize left" })
    vim.keymap.set('n', '<M-j>', require('smart-splits').resize_down, { desc = "Resize down" })
    vim.keymap.set('n', '<M-k>', require('smart-splits').resize_up, { desc = "Resize up" })
    vim.keymap.set('n', '<M-l>', require('smart-splits').resize_right, { desc = "Resize right" })
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = "Move to left pane" })
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = "Move to down pane" })
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = "Move to up pane" })
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = "Move to right pane" })
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous, { desc = "Move to previous pane" })
    -- swapping buffers between windows
    vim.keymap.set('n', '<S-M>h', require('smart-splits').swap_buf_left, { desc = "Swap left" })
    vim.keymap.set('n', '<S-M>j', require('smart-splits').swap_buf_down, { desc = "Swap left" })
    vim.keymap.set('n', '<S-M>k', require('smart-splits').swap_buf_up, { desc = "Swap left" })
    vim.keymap.set('n', '<S-M>l', require('smart-splits').swap_buf_right, { desc = "Swap left" })
  end
}

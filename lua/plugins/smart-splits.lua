return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      default_amount = 1,
      at_edge = "wrap",
    })

    -- resizing splits
    -- these keymaps will also accept a range,
    vim.keymap.set('n', '<M-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<M-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<M-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<M-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<S-M>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<S-M>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<S-M>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<S-M>l', require('smart-splits').swap_buf_right)
  end
}

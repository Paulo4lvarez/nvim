return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      default_amount = 1,
      at_edge = "wrap",
    })

    -- resizing splits
    -- these keymaps will also accept a range,
    vim.keymap.set('n', '<leader><C-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<leader><C-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<leader><C-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<leader><C-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
  end
}

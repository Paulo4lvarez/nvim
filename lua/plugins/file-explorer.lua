return {
  "echasnovski/mini.files",
  version = false,
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    require("mini.files").setup()

    vim.keymap.set("n", "<leader>o", ":lua MiniFiles.open()<CR>", {})
  end,
}

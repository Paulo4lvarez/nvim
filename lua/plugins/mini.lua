-- This config doesn't mainly use mini, but those plugins from mini I *do* use will be here.
return {
  {
    'echasnovski/mini.pairs', version = false
  },
  {
    'echasnovski/mini.surround', version = false
  },
  {
    "echasnovski/mini.files",
    version = false,
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("mini.files").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()

      vim.keymap.set("n", "<leader>o", ":lua MiniFiles.open()<CR>", { silent = false })
    end,
  },
}

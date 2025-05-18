return {
  {
    "zaldih/themery.nvim",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
      })
      require("themery").setup({
        themes = {
          "kanagawa-wave",
          "kanagawa-dragon",
          "kanagawa-lotus",
        },
        livePreview = true
      })

      vim.cmd [[colorscheme kanagawa-wave]]
    end
  },
}

return {
  {
    "zaldih/themery.nvim",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      local transparency = true
      require("kanagawa").setup({
        undercurl = true,
        transparent = transparency,
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
      if transparency then
        vim.cmd [[highlight TelescopeBorder guibg=none]]
        vim.cmd [[highlight TelescopeTitle guibg=none]]
      end
    end
  },
}

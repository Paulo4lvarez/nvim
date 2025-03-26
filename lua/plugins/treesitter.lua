return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "bash",
        "lua",
        "java",
        "kotlin",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "html",
        "css",
        "json",
        "vue",
        "gitignore",
        "python",
        "markdown",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

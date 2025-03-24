return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "cpp", "cmake", "bash", "lua", "java", "kotlin", "vim", "vimdoc", "query", "javascript", "html", "css", "json", "vue",  "gitignore", "python", "sql", "markdown" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}

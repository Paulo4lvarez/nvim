return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Config
          "lua_ls",
          -- Web
          "eslint",
          "ts_ls",
          "vuels",
          "cssls",
          "tailwindcss",
          "html",
          "jsonls",
          -- Java
          "java_language_server",
          "kotlin_language_server",
          -- C Family
          "clangd",
          "cmake",
          -- Shell
          "bashls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      lspconfig.lua_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.vuels.setup({})
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.html.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.java_language_server.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})
      lspconfig.bashls.setup({})
    end,
  },
}

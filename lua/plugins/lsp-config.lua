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
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilites = require("cmp_nvim_lsp").default_capabilities()

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      lspconfig.lua_ls.setup({ capabilities = capabilites })
      lspconfig.eslint.setup({ capabilities = capabilites })
      lspconfig.ts_ls.setup({ capabilities = capabilites })
      lspconfig.vuels.setup({ capabilities = capabilites })
      lspconfig.cssls.setup({ capabilities = capabilites })
      lspconfig.tailwindcss.setup({ capabilities = capabilites })
      lspconfig.html.setup({ capabilities = capabilites })
      lspconfig.jsonls.setup({ capabilities = capabilites })
      lspconfig.java_language_server.setup({ capabilities = capabilites })
      lspconfig.kotlin_language_server.setup({ capabilities = capabilites })
      lspconfig.clangd.setup({ capabilities = capabilites })
      lspconfig.cmake.setup({ capabilities = capabilites })
      lspconfig.bashls.setup({ capabilities = capabilites })
    end,
  },
}

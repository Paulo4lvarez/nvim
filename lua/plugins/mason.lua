return {
  { "mason-org/mason.nvim",          opts = {} },
  { "mason-org/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "mason-org/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          width = 0.8,
          height = 0.8,
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Config
          "lua_ls",
          -- Web
          "ts_ls",
          "vuels",
          "tailwindcss",
          "eslint",
          "html",
          "jsonls",
          -- C Family
          "clangd",
          "cmake",
          -- Rust
          "rust_analyzer",
        },
      })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

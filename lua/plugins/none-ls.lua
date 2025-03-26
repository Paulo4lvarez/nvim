return {
  -- "nvimtools/none-ls.nvim",
  -- dependencies = {
  -- "nvimtools/none-ls-extras.nvim",
  -- },
  -- config = function()
  -- local null_ls = require("null-ls")
  --
  -- null_ls.setup({
  -- sources = {
  -- null_ls.builtins.formatting.stylua,
  -- require("none-ls.formatting.eslint"),
  -- require("none-ls.diagnostics.eslint"),
  -- require("none-ls.code_actions.eslint"),
  -- },
  -- })
  --
  -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  -- end,

  "zeioth/none-ls-autoload.nvim",
  event = "BufEnter",
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim", "zeioth/none-ls-external-sources.nvim" },
  opts = {
    external_sources = {
      'none-ls-external-sources.diagnostics.eslint',
      'none-ls-external-sources.diagnostics.eslint_d',
      'none-ls-external-sources.formatting.eslint',
      'none-ls-external-sources.formatting.eslint_d',
      'none-ls-external-sources.code_actions.eslint',
      'none-ls-external-sources.code_actions.eslint_d',
    }
  },
  config = function()
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end
}

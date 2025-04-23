return {
  "zeioth/none-ls-autoload.nvim",
  event = "BufEnter",
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim", "zeioth/none-ls-external-sources.nvim" },
  opts = {
    external_sources = {
      'none-ls-external-sources.diagnostics.eslint',
      'none-ls-external-sources.diagnostics.eslint_d',
      'none-ls-external-sources.code_actions.eslint',
      'none-ls-external-sources.code_actions.eslint_d',
    }
  },
  config = function()
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end
}

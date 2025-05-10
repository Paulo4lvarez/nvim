return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      windowCreationCommand = "botright vsplit %",
    })

    vim.keymap.set("n", "<leader>fg", "<CMD>GrugFar<CR>", { desc = "Grug Far Find and Replace" })
  end,
}

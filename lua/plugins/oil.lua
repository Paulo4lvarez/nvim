return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup()
	end,
}

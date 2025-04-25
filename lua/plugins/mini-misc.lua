return {
	{
		"echasnovski/mini.pairs",
		version = false,
	},
	{
		"echasnovski/mini.surround",
		version = false,
	},
	config = function()
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}

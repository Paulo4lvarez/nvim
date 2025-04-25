return {
	{ "williamboman/mason.nvim", opts = {} },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			-- local capabilites = require("cmp_nvim_lsp").default_capabilities()
			local capabilites = require("blink.cmp").get_lsp_capabilities()

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Config
					"lua_ls",
					-- Web
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
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilites = capabilites })
				end,
			})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

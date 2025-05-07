return {
	{ "mason-org/mason.nvim", opts = {} },
	{ "mason-org/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"mason-org/mason.nvim",
		config = function()
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
					"eslint",
					"html",
					"jsonls",
					-- Java
					"java_language_server",
					"kotlin_language_server",
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

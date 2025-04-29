-- This config doesn't mainly use mini, but those plugins from mini I *do* use will be here.
local au_group = vim.api.nvim_create_augroup("__mini", { clear = true })
local minifiles_toggle = function(...)
	local f = require("mini.files")
	local arg_len = ... == nil and 0 or #...
	if not f.close() then
		if arg_len == 0 then
			f.open(f.get_latest_path())
		else
			f.open(...)
		end
	end
end

return {
	{
		"echasnovski/mini.icons",
		version = false,
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-dev-icons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").setup()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
	},
	{
		"echasnovski/mini.surround",
		version = false,
	},
	{
		"echasnovski/mini.files",
		version = false,
		keys = {
			{
				"<leader>o",
				minifiles_toggle,
				desc = "Toggle file explorer",
			},
			{
				"<leader>O",
				function()
					minifiles_toggle(vim.api.nvim_buf_get_name(0), false)
				end,
				desc = "Toggle file explorer(current file)",
			},
		},
		dependencies = {
			"echasnovski/mini.icons",
			{ "antosha417/nvim-lsp-file-operations", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		config = function()
			require("mini.pairs").setup()
			require("mini.surround").setup()
			require("mini.files").setup({
				options = { use_as_default_explorer = true },
				windows = { preview = true, width_focus = 45, width_nofocus = 10, width_preview = 50 },
			})

			require("lsp-file-operations").setup()

			local events = {
				["lsp-file-operations.did-rename"] = { { "MiniFilesActionRename", "MiniFilesActionMove" }, "Renamed" },
				["lsp-file-operations.will-create"] = { "MiniFilesActionCreate", "Create" },
				["lsp-file-operations.will-delete"] = { "MiniFilesActionDelete", "Delete" },
			}
			for module, pattern in pairs(events) do
				vim.api.nvim_create_autocmd("User", {
					pattern = pattern[1],
					group = au_group,
					desc = string.format("Auto-refactor LSP file %s", pattern[2]),
					callback = function(event)
						local ok, action = pcall(require, module)
						if not ok then
							return
						end
						local args = {}
						local data = event.data
						if data.from == nil or data.to == nil then -- when the `pattern` is "create" or "delete"
							args = { fname = data.from or data.to }
						else
							args = { old_name = data.from, new_name = data.to }
						end
						action.callback(args)
					end,
				})
			end
		end,
	},
}

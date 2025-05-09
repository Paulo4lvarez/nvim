-- This config doesn't mainly use mini, but those plugins from mini I *do* use will be here.
local minifiles = require("mini.files")

local minifiles_toggle = function(...)
	local arg_len = ... == nil and 0 or #...
	if not minifiles.close() then
		if arg_len == 0 then
			minifiles.open(minifiles.get_latest_path())
		else
			minifiles.open(...)
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
		},
		lazy = false,
		config = function()
			-- Load plugins and mini.files with some config
			require("mini.pairs").setup()
			require("mini.surround").setup()
			require("mini.files").setup({
				options = { use_as_default_explorer = true },
				windows = { preview = true, width_focus = 40, width_nofocus = 10, width_preview = 50 },
			})

			-- Something to make windows a fixed height
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesWindowUpdate",
				callback = function(args)
					local config = vim.api.nvim_win_get_config(args.data.win_id)

					-- Ensure fixed height
					config.height = 25

					-- Ensure no title padding
					local n = #config.title
					config.title[1][1] = config.title[1][1]:gsub("^ ", "")
					config.title[n][1] = config.title[n][1]:gsub(" $", "")

					vim.api.nvim_win_set_config(args.data.win_id, config)
				end,
			})

			-- Config for opening files in new splits.
			local map_split = function(buf_id, lhs, direction)
				local rhs = function()
					-- Make new window and set it as target
					local cur_target = minifiles.get_explorer_state().target_window
					local new_target = vim.api.nvim_win_call(cur_target, function()
						vim.cmd(direction .. " split")
						return vim.api.nvim_get_current_win()
					end)

					minifiles.set_target_window(new_target)

					-- This intentionally doesn't act on file under cursor in favor of
					-- explicit "go in" action (`l` / `L`). To immediately open file,
					-- add appropriate `MiniFiles.go_in()` call instead of this comment.
				end

				-- Adding `desc` will result into `show_help` entries
				local desc = "Split " .. direction
				vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					-- Tweak keys to your liking
					map_split(buf_id, "<M>-", "belowright horizontal")
					map_split(buf_id, "<M>=", "belowright vertical")
				end,
			})
		end,
	},
}

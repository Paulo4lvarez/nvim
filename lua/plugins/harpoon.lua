return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local make_finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table(
          {
            results = paths
          }
        )
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = make_finder(),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_buffer_number, map)
          map(
            "i",
            "<M-d>", -- your mapping here
            function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_buffer_number)

              harpoon:list():removeAt(selected_entry.index)
              current_picker:refresh(make_finder())
            end
          )

          return true
        end
      }):find()
    end

    vim.keymap.set("n", "<leader>e", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add file to harpoon" })

    vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end, { desc = "Go to harpoon file 1" })
    vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end, { desc = "Go to harpoon file 2" })
    vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end, { desc = "Go to harpoon file 3" })
    vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end, { desc = "Go to harpoon file 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Go to previous harpoon file" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Go to next harpoon file" })
  end
}

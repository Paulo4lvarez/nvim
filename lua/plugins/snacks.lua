return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██╗███████╗███╗   ███╗  ████╗   ██████╗  ███████╗
██║██╔════╝████╗ ████║ ██╔═██╗ ██╔═══██╗██╔═════╝
██║█████╗  ██╔████╔██║██╔╝  ██╗██║   ╚═╝╚██████╗ ⠀
╚═╝██╔══╝  ██║ ██╔╝██║████████║██║   ██╗ ╚════██╗
██╗███████╗██║ ╚═╝ ██║██╔═══██║╚██████╔╝███████╔╝
╚═╝╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝ ╚═════╝ ╚══════╝⠀
fast as fuck, boi
]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "󰪶 ", key = "o", desc = "Browse Files", action = "<CMD>Oil<CR>" },
          { icon = " ", key = "g", desc = "Git", action = "<CMD>Neogit<CR>" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      sections = {
        { section = "header" },
        { icon = "", section = "keys", gap = 1, padding = 1 },
        { icon = " ", title = "Projects", padding = 1 },
        { section = "projects", padding = 1 },
        { section = "startup" },
      },

      wo = {
        winhighlight = "Normal:Normal,NormalFloat:Normal",
      },
    },
    indent = { only_current = true, animate = { enabled = false } },
  },
}

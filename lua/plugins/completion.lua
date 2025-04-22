return {
  'saghen/blink.cmp',

  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

  version = '1.*',

  opts = {

    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = 'super-tab',
      ['<M-Tab>'] = { 'select_prev', 'fallback' },
      ['<S-M-Tab>'] = { 'select_next', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      menu = { border = 'single' },
      documentation = {
        window = { border = 'single' },
        auto_show = true
      },
    },
    signature = { window = { border = 'single' } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    snippets = { preset = 'luasnip' },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        cmdline = {
          -- ignores cmdline completions when executing shell commands
          enabled = function()
            return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
          end
        }
      }
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust" }
  },
  opts_extend = { "sources.default" }
}

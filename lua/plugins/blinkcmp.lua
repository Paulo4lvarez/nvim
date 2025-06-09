return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregxp" },
  version = "1.*",
  opts_extend = { "sources.default" },
  config = function()
    local is_enabled = function()
      local disabled_ft = {
        "TelescopePrompt",
        "grug-far",
      }
      return not vim.tbl_contains(disabled_ft, vim.bo.filetype)
          and vim.b.completion ~= false
          and vim.bo.buftype ~= "prompt"
    end

    require("blink.cmp").setup({
      enabled = is_enabled,
      cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } }
      },
      keymap = {
        preset = "super-tab",
      },
      completion = {
        menu = {
          scrollbar = false,
          auto_show = is_enabled,
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              },
              kind = {
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              }
            }
          }
        },
        documentation = {
          auto_show = true,
          window = {
            border = "solid"
          }
        },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          cmdline = {
            -- ignores cmdline completions when executing shell commands
            enabled = function()
              return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
            end,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust" },
    })
  end
}

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
    config = function()
      -- Load plugins and mini.files with some config
      require("mini.pairs").setup()
      require("mini.surround").setup()
    end,
  },
}

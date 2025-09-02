return {
  "3rd/image.nvim",
  build = false,
  enabled = function()
    if jit.os ~= "Linux" or jit.os ~= "OSX" then
      return false
    end
    return true
  end,
  opts = {
    processor = "magick_cli",
  },
}

return {
  "3rd/image.nvim",
  build = false,
  enabled = function()
    if jit.os ~= "Linux" then
      return false
    end
    return true
  end,
  opts = {
    processor = "magick_cli",
  }
}

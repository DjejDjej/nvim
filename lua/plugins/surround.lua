return {
  "kylechui/nvim-surround",
  event = "VeryLazy", -- Lazy load to improve startup performance
  config = function()
    require("nvim-surround").setup({
      -- Add any additional configuration if needed
      keymaps = {
        normal = "ys",              -- Surround in normal mode
        normal_cur = "yss",         -- Surround current line in normal mode
        delete = "ds",              -- Delete surrounding characters
        change = "cs"               -- Change surrounding characters
      },
    })
  end,
}

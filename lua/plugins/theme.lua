-- lua/plugins/theme.lua

return {
  -- AstroNvim's astrotheme
  {
    "AstroNvim/astrotheme",
    priority = 1000, -- Load it first to ensure it's applied before other plugins
    config = function()
      -- Configure and apply astrotheme
      require("astrotheme").setup({
        style = "dark", -- Set to "light" if you prefer a light theme
        transparent = false, -- Disable background transparency (you can enable it by setting this to true)
        terminal_colors = true, -- Enable terminal colors
      })

      -- Set astrotheme as the default colorscheme
      vim.cmd("colorscheme astrotheme")
    end,
  },
}


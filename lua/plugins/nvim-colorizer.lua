return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy", -- Lazy load to avoid performance issues on startup
    config = function()
      require("colorizer").setup({
        -- Filetypes to enable color highlighting
        'css',
        'javascript',
        'html',
        'lua',
        'vim',
        'markdown',
        'rosi',
        -- Add any filetypes where you want colorizer to work
      }, {
        -- Enable true color support for better accuracy
        RGB = true,
        RRGGBB = true,
        names = false, -- Disable color names like "Blue" to prevent conflicts
        RRGGBBAA = true, -- Enable support for 8-digit hex codes
        rgb_fn = true, -- Enable rgb(...) and rgba(...) functions
        hsl_fn = true, -- Enable hsl(...) and hsla(...) functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  }
}


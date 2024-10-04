-- lua/plugins/init.lua

return {
  -- Make sure lualine.nvim is correctly defined here
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- Lazy load lualine for performance
    config = function()
      -- This should correctly set up lualine
      require("lualine").setup({
        options = {
          theme = "astrotheme",  -- Automatically adapt to your theme
          section_separators = "",
          component_separators = "",
          globalstatus = true,  -- Make the status line global
        },
        sections = {
          lualine_a = { "mode" },      -- Show current mode
          lualine_b = { "filename" },  -- Show filename
          lualine_c = {},
          lualine_x = { "filetype" },  -- Show file type
          lualine_y = { "location" },  -- Show location (line and column)
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}


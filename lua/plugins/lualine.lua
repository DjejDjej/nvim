return {
  -- Lualine configuration
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- Lazy load lualine for performance
    config = function()
      -- Hardcoded OS logo for Arch Linux
      local function os_logo()
        return "" .. "󰣇" .. ""  -- Add spaces around the logo
      end


      -- Setup lualine
      require("lualine").setup({
        options = {
          theme = "astrotheme",  -- Automatically adapt to your theme
          section_separators = "",
          component_separators = "",
          globalstatus = true,  -- Make the status line global
        },
        sections = {
          lualine_a = { "mode" },             -- Show current mode
          lualine_b = { "filename" },         -- Show filename
          lualine_c = { },             -- Show hardcoded Arch Linux logo
          lualine_x = { "filetype" },         -- Show file type
          lualine_y = { "location" },         -- Show location (line and column)
          lualine_z = {os_logo },
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


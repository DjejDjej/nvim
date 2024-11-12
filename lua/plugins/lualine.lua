
local colors = {
  black        = '#282828',
  white        = '#ffffff',
  red          = '#fb4934',
  green        = '#00FF00',
  blue         = '#0096FF',
  yellow       = '#fe8019',
  purple       = '#C11C84',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
  custom_bg    = '#1a1d23',  -- Background color
}

-- Lualine theme configuration with updated background and foregrounds
local gruvbox_theme = {
  normal = {
    a = {bg = colors.custom_bg, fg = colors.blue, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.white},
    c = {bg = colors.custom_bg, fg = colors.white}
  },
  insert = {
    a = {bg = colors.custom_bg, fg = colors.green, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.white},
    c = {bg = colors.custom_bg, fg = colors.white}
  },
  visual = {
    a = {bg = colors.custom_bg, fg = colors.purple, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.white},
    c = {bg = colors.custom_bg, fg = colors.white}
  },
  replace = {
    a = {bg = colors.custom_bg, fg = colors.red, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.white},
    c = {bg = colors.custom_bg, fg = colors.white}
  },
  command = {
    a = {bg = colors.custom_bg, fg = colors.green, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.white},
    c = {bg = colors.custom_bg, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.custom_bg, fg = colors.inactivegray, gui = 'bold'},
    b = {bg = colors.custom_bg, fg = colors.inactivegray},
    c = {bg = colors.custom_bg, fg = colors.inactivegray}
  }
}
return {
  -- Lualine configuration
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- Lazy load lualine for performance
    config = function()


      -- Setup lualine
      require("lualine").setup({
        options = {

    theme = gruvbox_theme,
          section_separators = "",
          component_separators = "",
          globalstatus = true,  -- Make the status line global
        },
        sections = {
          lualine_a = {"mode"},             -- Show current mode
          lualine_b = {'filetype'},             -- Show hardcoded Arch Linux logo
          lualine_c = {},             -- Show hardcoded Arch Linux logo
          lualine_x = {},         -- Show file type
          lualine_y = {},         -- Show location (line and column)
          lualine_z = {"location"},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}


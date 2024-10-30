return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1, -- Load it first to ensure it's applied before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- Options: latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- Disable background transparency
        show_end_of_buffer = false, -- Hide '~' after the end of buffers
        term_colors = false, -- Disable terminal colors
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Allow italic
        no_bold = false, -- Allow bold
        no_underline = false, -- Allow underline
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          all = {
            background = "#1a1d23",
          },
          latte = {
            base = "#1a1d23",
            mantle = "#1a1d23",
            crust = "#1a1d23",
          },
          frappe = {
            base = "#1a1d23",
            mantle = "#1a1d23",
            crust = "#1a1d23",
          },
          macchiato = {
            base = "#1a1d23",
            mantle = "#1a1d23",
            crust = "#1a1d23",
          },
          mocha = {
            base = "#1a1d23",
            mantle = "#1a1d23",
            crust = "#1a1d23",
          },
        },
        custom_highlights = {
          -- Customize color for vertical lines and line numbers
          IndentBlanklineChar = { fg = "#A9A9A9" },  -- Sets the color of indent lines to black
          VertSplit = { fg = "#A9A9A9" },           -- Sets vertical split color to black
          LineNr = { fg = "#A9A9A9" },              -- Sets line numbers color to black (optional)
          CursorLineNr = { fg = "#A9A9A9" },        -- Sets current line number color to black (optional)
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      -- Set Catppuccin as the default colorscheme
      vim.cmd("colorscheme catppuccin")
    end,
  },
}


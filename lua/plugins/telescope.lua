return {
  -- Telescope setup
  {
    "nvim-telescope/telescope.nvim",
    branch = "master", -- Use the latest version
    event = "VeryLazy", -- Lazy load on demand
    requires = { { "nvim-lua/plenary.nvim" } }, -- Telescope depends on plenary.nvim
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = { "truncate" },
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
              prompt_position = "top", -- Move prompt to top
              results_width = 0.8,
            },
            width = 0.85, -- Set layout width
            height = 0.75, -- Set layout height
            preview_cutoff = 120, -- Hide preview for small windows
          },
          sorting_strategy = "ascending",
          file_ignore_patterns = { "node_modules", ".git/" },
          border = {}, -- Enable borders
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- Customize border style
        },
        pickers = {
          find_files = {
            theme = "dropdown", -- Use dropdown theme for find_files
            previewer = false,
            layout_config = {
              width = 0.6, -- Adjust dropdown width
              height = 0.4, -- Adjust dropdown height
            },
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- Add border to dropdown
          },
        },
        extensions = {
          -- You can load extensions here
        },
      })

      -- Set the header text and border to the same blue color
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#569CD6" }) -- Blue prefix (based on your screenshot)
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#569CD6" }) -- Set prompt title to blue
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#569CD6" }) -- Set results title to blue
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#569CD6" }) -- Set preview title to blue
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#569CD6" }) -- Set border to blue
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#569CD6" }) -- Set prompt border to blue
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#569CD6" }) -- Set results border to blue
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#569CD6" }) -- Set preview border to blue

      -- Load Telescope extensions after setup (if necessary)
      -- require("telescope").load_extension("your_extension")
    end,
  }
}


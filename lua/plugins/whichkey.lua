return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    require("which-key").setup({
      icons = {
        breadcrumb = "",      -- Remove breadcrumb symbol
        separator = "",       -- Remove separator symbol
        group = "",           -- Remove group icon (blue square)
        mappings = false,     -- Attempt to disable icons for mappings (undocumented but may work)
      },
      plugins = {
        marks = false,        -- Disable marks icons
        registers = false,    -- Disable registers icons
      },
      show_help = false,      -- Disable help message to avoid extra icons

    })
  end,
}


return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    require("which-key").setup({
      icons = {
        breadcrumb = "»", -- symbol used in the command path
        separator = "→",  -- symbol used between a key and its label
        group = ""        -- set to an empty string to remove the group icon (blue square)
      },
      -- Add any other configurations if needed
    })
  end,
}


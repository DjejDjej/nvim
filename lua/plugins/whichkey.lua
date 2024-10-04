return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    require("which-key").setup({
      -- You can add any custom configuration options here if needed
    })
  end,
}


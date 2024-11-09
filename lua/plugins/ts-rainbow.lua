return {
  "p00f/nvim-ts-rainbow",
  event = "VeryLazy", -- Lazy load for performance
  config = function()
    require("nvim-treesitter.configs").setup {
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-bracket delimiters
        max_file_lines = 1000, -- Disable for files with more than 1000 lines
      },
    }
  end,
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure Treesitter is also installed
}


return {
  "echasnovski/mini.ai",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    require("mini.ai").setup({
      n_lines = 300,  -- Set the maximum number of lines for which text objects are defined
      custom_textobjects = {
        -- You can define your custom text objects here
      },
      -- Add any other configurations if needed
    })
  end,
}


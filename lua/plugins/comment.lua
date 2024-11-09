return {
  "numToStr/Comment.nvim",
  event = "VeryLazy", -- Lazy load Comment.nvim for performance
  config = function()
    require("Comment").setup()
  end,
}


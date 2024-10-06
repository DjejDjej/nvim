return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy", -- Lazy load
    config = function()
      require("notify").setup({
        stages = "fade", -- Animation for notifications
        timeout = 1000,  -- Timeout duration for notifications in milliseconds
        background_colour = "#000000", -- Background color for the notification
        icons = {
          ERROR = "✖️",
          WARN = "⚠️",
          INFO = "ℹ️",
          DEBUG = "🐞",
          TRACE = "🔍",
        },
        -- Add any other configurations if needed
      })
      vim.notify = require("notify")  -- Override the default notify function
    end,
  },
}


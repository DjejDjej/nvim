return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy", -- Lazy load to enhance startup performance
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered
      hint_enable = false, -- Show virtual text hint
      floating_window = true, -- Enable floating window for function signature help
      floating_window_above_cur_line = true, -- Position the floating window above the cursor line if space allows
      handler_opts = {
        border = "single", -- Border style for the floating window (other options: single, double, shadow)
      },
      always_trigger = false, -- Set to true if you want the signature to be triggered without typing in insert mode
      auto_close_after = nil, -- Set a number (in seconds) to close signature help automatically
      extra_trigger_chars = { "(", "," }, -- Additional characters to trigger signature help
      zindex = 50, -- Floating window zindex
    })
  end,
}


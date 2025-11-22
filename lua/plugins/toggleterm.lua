
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        size = 10,
        open_mapping = [[<C-\>]],
        start_in_insert = true,
        direction = "horizontal",
        close_on_exit = true,
        persist_size = true,
      })

      -- Function to toggle focus between terminal and editor
      function _G.toggle_terminal_focus()
        -- If currently in a toggleterm buffer
        if vim.bo.filetype == "toggleterm" then
          vim.cmd("stopinsert")   -- leave insert mode
          vim.cmd("wincmd p")     -- go to previous window (editor)
        else
          -- Go to the last terminal window
          local found_term = false
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "toggleterm" then
              vim.api.nvim_set_current_win(win)
              vim.cmd("startinsert")
              found_term = true
              break
            end
          end
          -- If no terminal found, open a new one
          if not found_term then
            vim.cmd("ToggleTerm")
          end
        end
      end

      -- Map Ctrl+t in normal and terminal modes
      vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _G.toggle_terminal_focus()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>lua _G.toggle_terminal_focus()<CR>", { noremap = true, silent = true })
    end,
  },
}

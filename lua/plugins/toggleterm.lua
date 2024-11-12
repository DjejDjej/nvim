return {
{
    "akinsho/toggleterm.nvim",
    version = "*",  -- Use the latest version or specify a tag
    config = function()
      require("toggleterm").setup({
        size = function(term)
          return vim.o.lines * 0.1 -- 10% of window height
        end,
        direction = "horizontal", -- or "float" for a floating terminal
        persist_size = true,
        close_on_exit = true,
        shell = vim.o.shell,
        autochdir = true,
        start_in_insert = true,
        shade_terminals = false, -- Disable shading for a cleaner look
        winbar = {
          enabled = false, -- No winbar to reduce lines
        },
        float_opts = {
          border = "none", -- No borders around the terminal
        },
      })

      -- Remove window separators globally
      vim.opt.fillchars = {
        horiz = " ",
        horizup = " ",
        horizdown = " ",
        vert = " ",
        vertleft = " ",
        vertright = " ",
        verthoriz = " ",
      }

      -- Disable statusline for toggleterm windows
      vim.cmd([[
        autocmd TermOpen * setlocal noshowmode nonumber norelativenumber laststatus=0
        autocmd TermClose * setlocal laststatus=2
      ]])

      -- Function to toggle between terminal and previous buffer
      function _G.toggle_term_and_buffer()
        local term_buf = nil
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            term_buf = buf
            break
          end
        end

        if term_buf then
          -- If we're in terminal, switch to previous window
          vim.cmd("wincmd p")
        else
          -- Otherwise, open the terminal
          vim.cmd("ToggleTerm")
        end
      end

      -- Keybinding to toggle between terminal and buffer using <Leader>t
    end,
  },
}


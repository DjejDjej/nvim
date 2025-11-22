local header = {
  "⠀⠀⠀⠀⢀⣶⡖⢦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠙⠋⠹⣦⠘⠉⠳⢤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠙⠛⠓⠶⣶⣶⣿⣛⣀⣰⣆⣀⣀⠉⠛⢶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠉⠉⠙⢷⣦⡀⠈⠻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠶⢶⣶⣾⣿⡀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢠⡞⠋⠀⣠⣶⣖⣻⣿⠟⠀⠀⣸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢻⣄⠀⠀⠈⠙⠛⠉⠁⠀⣠⣾⡟⠉⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢀⣠⠿⠿⣿⣿⣿⡿⠿⢿⣿⣯⣿⡇⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⣰⠟⠁⠀⣀⣤⣤⣤⣤⣤⣤⣼⣿⣿⠇⠀⢈⣟⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⢰⡏⠀⠀⣾⣏⠁⠀⠀⠀⢀⣀⣴⡿⠋⠀⠀⣼⠟⣦⡀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠈⢷⣄⡀⠈⠙⠛⠛⠛⠛⠋⠉⠁⢀⣠⣴⣿⡟⠀⠸⣇⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⣈⣽⣿⣶⣶⣶⣶⣶⣶⣾⣿⣯⣍⠀⠘⡗⠀⠀⣿⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⣰⠞⠉⠉⠀⢀⣀⣀⣀⣀⡀⠀⠀⠹⣿⣷⣼⡇⠀⢀⡿⠀⠀⠀⠀⢠⢦",
  "⠀⠀⣾⠋⠀⠀⢰⡿⠛⠉⠉⠉⠉⠙⠿⠷⣦⣼⣿⠏⠀⢀⣾⡃⠀⠀⠀⣀⡿⣹",
  "⠀⠀⢿⡀⠀⠀⠘⢿⣦⣄⣀⣤⣤⣤⣤⡶⠿⠋⠁⠀⣠⣾⡏⠛⠓⠒⠛⣩⡴⠃",
  "⠀⠀⠈⠻⣦⣀⡀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⣀⣴⡾⠛⠛⠿⠶⠶⠶⠞⠋⠀⠀",
  "⠀⠀⠀⠀⠈⠛⠿⠿⠿⠿⣿⣶⡶⠶⠶⠿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

return {
  { "nvimdev/dashboard-nvim", enabled = false },
  { "echasnovski/mini.starter", enabled = false },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Set snake ASCII art as header
      dashboard.section.header.val = header

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("w", " " .. " New file", ":enew<CR>"),
        dashboard.button("f", "󰍉 " .. " Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep<CR>"),
        dashboard.button("x", " " .. " Work", ":Oil " .. os.getenv('HOME') .. "/work<CR>"),
        dashboard.button("c", " " .. " Config", ":Oil " .. os.getenv('HOME') .. "/.config/nvim<CR>"),
        dashboard.button("q", " " .. " Quit", "<cmd> qa <CR>"),
      }

      -- Footer
      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
      end

      -- Highlight colors
      vim.api.nvim_set_hl(0, "AlphaHeaderYellow", { fg = "#FFFF00" })  -- Snake header
      vim.api.nvim_set_hl(0, "AlphaFooterBlue", { fg = "#569CD6" })     -- Footer
      vim.api.nvim_set_hl(0, "AlphaButtonGreen", { fg = "#00FF00" })    -- Quit button

      dashboard.section.header.opts.hl = "AlphaHeaderYellow"
      dashboard.section.footer.opts.hl = "AlphaFooterBlue"
      dashboard.section.buttons.val[6].opts.hl = "AlphaButtonGreen" -- Quit button

      -- Layout
      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 5 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)
    end,
  },
}

return {
  -- Treesitter setup
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "yaml", "lua", "bash", "python", "javascript" },
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = false,
        },
      })
    end,
  },

  -- Indent-Blankline (ibl) setup
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│", -- Character used for indentation guides
        highlight = { "IblIndentBlack" }, -- Use a single black highlight group for all indent guides
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "help", "terminal", "dashboard" },
      },
    },
    config = function()
      local hooks = require "ibl.hooks"
      -- Use the HIGHLIGHT_SETUP hook to ensure the highlight group is created
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblIndentBlack", { fg = "#4d4d4d" }) -- Set black color for indent guides
      end)

      require("ibl").setup({
        indent = {
          char = "│",
          highlight = { "IblIndentBlack" },
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = { "help", "terminal", "dashboard" },
        },
      })
    end,
  },
}


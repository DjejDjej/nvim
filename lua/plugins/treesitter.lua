return {
  -- Treesitter setup
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" }, -- Lazy load Treesitter when a file is opened
    build = ":TSUpdate", -- Automatically update parsers
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "yaml", "lua", "bash", "python", "javascript" }, -- Add your languages here
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true, -- Enable Treesitter-based syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable regex-based highlighting for better performance
        },

        indent = {
          enable = false, -- Enable Treesitter-based indentation
        },
      })
    end,
  },


  -- Indent-Blankline (now ibl) setup for version 3
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- Ensure that 'ibl' is the main module used
    event = { "BufReadPost", "BufNewFile" }, -- Lazy load when opening files
    opts = {
      indent = {
        char = "│", -- Character used for indentation guides
      },
      scope = {
        enabled = false, -- Disable scope highlighting
      },
      exclude = {
        filetypes = { "help", "terminal", "dashboard" }, -- Exclude specific file types
      },
    },
  }
} 


return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configure global diagnostics
      vim.diagnostic.config({
        virtual_text = false,
      })

      -- Global on_attach function to set up keybindings
      local on_attach = function(_, bufnr)
        -- Global keybinding for formatting
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<leader>l",
          "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
          { noremap = true, silent = true }
        )
      end

      -- List of LSP configurations to load
      local servers = {
        "gopls",
        "clangd",
      }

      for _, server in ipairs(servers) do
        local ok, lsp = pcall(require, "plugins.lsp." .. server)
        if ok then
          lsp.setup(lspconfig, on_attach)
        else
          vim.notify("Failed to load LSP config for " .. server, vim.log.levels.ERROR)
        end
      end
    end
  },

  -- Autocompletion Plugins
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",  -- Add friendly-snippets here
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load VSCode-style snippets for all supported languages
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm the selection with Enter
          ['<S-Tab>'] = cmp.mapping.complete(),              -- Trigger completion manually
          ['<C-e>'] = cmp.mapping.abort(),                   -- Abort completion
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'path', trailing_slash = true },
        }),
        completion = {
          autocomplete = false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
            return vim_item
          end,
        },
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()  -- Load VSCode-style snippets automatically
    end,
  },

  -- Install cmp-nvim-lsp for LSP autocompletion
  {
    "hrsh7th/cmp-nvim-lsp",
  },
}

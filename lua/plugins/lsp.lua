
return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({ virtual_text = false })

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<leader>l",
          "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
          { noremap = true, silent = true }
        )
      end

      local servers = { "gopls", "clangd", "groovy", "python", "bash" ,"docker" }

      for _, server in ipairs(servers) do
        local ok, lsp = pcall(require, "plugins.lsp." .. server)
        if ok then
          lsp.setup(lspconfig, on_attach)
        else
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
              local ft = vim.bo[args.buf].filetype
              if server == ft then
                vim.notify("LSP configuration for '" .. server .. "' not found!", vim.log.levels.ERROR)
              end
            end
          })
        end
      end
    end
  },

  -- lspsaga.nvim for enhanced LSP UI (floating diagnostics, code actions, etc.)
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = { enable = false },
        diagnostic = { on_insert = false, show_source = true },
      })
    end,
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
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = {
          ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<S-Tab>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'path', trailing_slash = true },
        }),
        completion = { autocomplete = false },
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

      cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
      })
    end,
  },

  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Install cmp-nvim-lsp for LSP autocompletion
  {
    "hrsh7th/cmp-nvim-lsp",
  },
}

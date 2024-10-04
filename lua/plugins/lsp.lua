return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Disable virtual text for diagnostics
      vim.diagnostic.config({
        virtual_text = false,
      })

      -- Enable LSP for Python (Pyright) with diagnostics disabled
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",  -- Disable all type checking
              diagnosticMode = "workspace",  -- Options: "workspace", "openFilesOnly"
              reportMissingImports = false,  -- Suppress warnings about missing imports
              reportUnusedImports = false,  -- Suppress warnings about unused imports
              reportUnusedVariables = false,  -- Suppress warnings about unused variables
              reportImplicitAny = false,  -- Suppress warnings for variables with no type annotations
              reportOptionalSubscript = false,  -- Suppress warnings for optional subscripts
              reportGeneralTypeIssues = false,  -- Suppress general type issues
            },
          },
        },
      })
    end
  },

  -- Autocompletion Plugins
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",      -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",        -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline",     -- Command-line source for nvim-cmp
      "L3MON4D3/LuaSnip",        -- Snippet engine
      "saadparwaiz1/cmp_luasnip" -- Snippet source for nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)  -- LuaSnip expand
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),  -- Manual trigger for autocompletion
          ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept selected completion item
          ['<C-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()  -- Select the next item if the completion menu is visible
            else
              cmp.complete()  -- Trigger completion if the menu is not visible
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),  -- Shift+Tab to go backwards in suggestions
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },   -- LSP completion
          { name = 'buffer' },     -- Buffer completion
          { name = 'luasnip' },    -- Snippet completion
          { name = 'path' },       -- Path completion
        }),
        completion = {
          autocomplete = false,  -- Disable automatic completion
        },
        window = {
          completion = cmp.config.window.bordered(), -- Border around completion window
          documentation = cmp.config.window.bordered(), -- Border around documentation
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 40) -- Truncate completion menu width to 40 characters
            return vim_item
          end,
        },
      })

      -- Setup buffer completion for `/` (search mode)
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Setup command-line completion for `:` (command-line mode)
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
      require("luasnip.loaders.from_vscode").lazy_load()  -- Load VSCode-style snippets
    end,
  },

  -- Install cmp-nvim-lsp for LSP autocompletion
  {
    "hrsh7th/cmp-nvim-lsp",
  },
}


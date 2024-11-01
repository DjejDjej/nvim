return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local format_on_demand = function()
        vim.lsp.buf.format({ async = true })
      end

      -- Set up a keybinding for <leader>l to format the document
      vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

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
              reportMissingImports = false,
              reportUnusedImports = false,
              reportUnusedVariables = false,
              reportImplicitAny = false,
              reportOptionalSubscript = false,
              reportGeneralTypeIssues = false,
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Attach the format keybinding on <leader>l
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
        end,
      })

      -- Setup YAML Language Server
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "k8s-*.yaml",
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
              ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
              ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
              ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
              ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Attach the format keybinding on <leader>l
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
        end,
      }

      -- Setup Go Language Server (gopls)
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true, -- Warn on unused parameters
            },
            staticcheck = true,   -- Enable additional static checks
          },
        },
        on_attach = function(client, bufnr)
          -- Attach the format keybinding on <leader>l
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
        end,
      })
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
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

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
          { name = 'path' },
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
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Install cmp-nvim-lsp for LSP autocompletion
  {
    "hrsh7th/cmp-nvim-lsp",
  },
}

